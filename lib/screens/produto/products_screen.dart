import 'package:dio/dio.dart';
import 'package:ecommercebonito/components/buttons/custom_search_field.dart';
import 'package:ecommercebonito/components/buttons/debouncer.dart';
import 'package:ecommercebonito/components/spacer/verticalSpacer.dart';
import 'package:ecommercebonito/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:ecommercebonito/shared/core/controllers/products_controller.dart';
import 'package:ecommercebonito/screens/produto/components/build_product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/components/buttons/category_menu.dart';
import 'package:ecommercebonito/components/appBar/custom_app_bar.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../cesta/cart_provider.dart';

class MenuProductsScreen extends StatefulWidget {
  const MenuProductsScreen({super.key});

  @override
  State<MenuProductsScreen> createState() => _MenuProductsScreenState();
}

class _MenuProductsScreenState extends State<MenuProductsScreen> {
  bool isLoading = true;
  final Debouncer debouncer = Debouncer(milliseconds: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final Map<String, dynamic> arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final int bancaId = arguments['id'];

      final produtoController = Get.find<ProductsController>();
      produtoController.initializeProducts(bancaId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartListProvider = Provider.of<CartProvider>(context);
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final int bancaId = arguments['id'];
    final String bancaNome = arguments['nome'];
    final String horarioAbertura = arguments['horario_abertura'];
    final String horarioFechamento = arguments['horario_fechamento'];

    String formatarHorario(String horario) {
      List<String> partes = horario.split(':');
      return '${partes[0]}:${partes[1]}';
    }

    String horarioAberturaFormatado = formatarHorario(horarioAbertura);
    String horarioFechamentoFormatado = formatarHorario(horarioFechamento);

    return GetBuilder<ProductsController>(
      init: ProductsController(Dio()),
      builder: (controller) => Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: BottomNavigation(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bancaNome,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Aberto das $horarioAberturaFormatado até $horarioFechamentoFormatado',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomSearchField(
                  fillColor: kOnBackgroundColorText,
                  iconColor: kDetailColor,
                  hintText: 'Buscar por produtos',
                  padding: const EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 12.0),
                  onSearch: (text) {
                    final produtoController = Get.find<ProductsController>();

                    if (text.isEmpty) {
                      produtoController.loadProdutos(bancaId);
                    } else {
                      debouncer.call(() =>
                          produtoController.searchProdutos(bancaId, text));
                    }
                  },
                  setLoading: (loading) {
                    setState(() {
                      isLoading = loading;
                    });
                  },
                ),
                const CategoryMenuList(),
                const VerticalSpacerBox(size: SpacerSize.medium),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: Column(
                        children: [
                          VerticalSpacer(size: 180),
                          CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(kDetailColor),
                          ),
                        ],
                      ),
                    );
                  } else if (controller.hasError ||
                      controller.produtos.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const VerticalSpacer(
                              size: 100,
                            ),
                            const Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: kDetailColor,
                                    size: 35,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Oops!',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: kDetailColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              'Nenhum produto foi encontrado.',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: kDetailColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Parece que não tem produtos nesta banca. Tente outra banca ou volte mais tarde.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: controller.produtos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BuildProductCard(controller.produtos[index],
                            controller, cartListProvider);
                      },
                    );
                  }
                }),
                const VerticalSpacerBox(size: SpacerSize.small),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
