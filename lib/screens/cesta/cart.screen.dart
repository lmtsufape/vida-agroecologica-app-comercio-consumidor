import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/screens/cesta/card_cart.dart';
import 'package:ecommerceassim/screens/pedidos/finalizar/finalize_purchase_screen.dart';
import 'package:ecommerceassim/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:ecommerceassim/shared/components/dialogs/notice_dialog.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:ecommerceassim/shared/core/models/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../components/buttons/primary_button.dart';
import '../../shared/constants/app_number_constants.dart';
import 'cart_controller.dart';
import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  final ProdutoModel? selectedProduct;

  const CartScreen({super.key, this.selectedProduct});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    final cartListProvider = Provider.of<CartProvider>(context);
    late int selectedIndex = 1;
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: BottomNavigation(paginaSelecionada: selectedIndex),
        body: Container(
          color: kOnSurfaceColor,
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const HorizontalSpacerBox(size: SpacerSize.small),
                  Text(
                    NumberFormat.simpleCurrency(
                            locale: 'pt-BR', decimalDigits: 2)
                        .format(cartListProvider.total),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const VerticalSpacerBox(size: SpacerSize.medium),
              PrimaryButton(
                text: 'Fechar Pedido (${cartListProvider.itens} itens)',
                onPressed: () {
                  if (cartListProvider.itens != 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinalizePurchaseScreen(
                                cartListProvider.listCart)));
                  } else {
                    alertDialog(context, 'Aviso',
                        'Sua cesta está vazia. Para fechar um pedido, adicione produtos a ela primeiro.');
                  }
                },
                color: kDetailColor,
              ),
              const VerticalSpacerBox(size: SpacerSize.large),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardCart(
                          cartListProvider.retriveCardItem(index), controller);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: size.height * 0.03,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: cartListProvider.listCart.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
