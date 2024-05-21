// ignore_for_file: avoid_print

import 'package:ecommercebonito/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:ecommercebonito/shared/core/repositories/pedidos_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:ecommercebonito/shared/core/controllers/pedidos_controller.dart';
import 'package:ecommercebonito/components/appBar/custom_app_bar.dart';
import 'package:ecommercebonito/components/forms/custom_order.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import '../../shared/constants/app_enums.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  int selectedIndex = 2;

  void _onOrderTapped(int orderId) {
    print('Pedido com id ID $orderId clicado!');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PedidoController(PedidosRepository(Dio())),
      child: Consumer<PedidoController>(
        builder: (context, controller, child) {
          if (controller.status == PedidosStatus.loading) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: const CustomAppBar(),
              bottomNavigationBar: BottomNavigation(
                paginaSelecionada: 2,
              ),
              body: const Center(
                child: CircularProgressIndicator(
                  color: kDetailColor,
                ),
              ),
            );
          }

          return Scaffold(
            appBar: const CustomAppBar(),
            bottomNavigationBar: BottomNavigation(
              paginaSelecionada: 2,
            ),
            body: Container(
              color: kOnSurfaceColor,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: controller.orders.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          const VerticalSpacerBox(size: SpacerSize.small),
                          ...List.generate(controller.orders.length, (index) {
                            var order = controller.orders[index];
                            return OrderCard(
                              orderNumber: '#${index + 1}',
                              sellerName:
                                  order.bancaNome ?? 'Banca Desconhecida',
                              itemsTotal: order.subtotal,
                              shippingHandling: order.taxaEntrega,
                              date: formatDate(order.dataPedido),
                              status: order.status,
                              onTap: () => _onOrderTapped(order.id),
                            );
                          }),
                          const VerticalSpacerBox(size: SpacerSize.medium),
                        ],
                      ),
                    )
                  : _buildEmptyListWidget(),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildEmptyListWidget() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.storefront, color: kDetailColor, size: 80),
          const SizedBox(height: 20),
          const Text(
            'Nenhum pedido encontrado.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kDetailColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Você ainda não tem pedidos realizados ou estão indisponíveis no momento.',
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
}

String formatDate(DateTime? date) {
  if (date == null) return 'Date N/A';
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}
