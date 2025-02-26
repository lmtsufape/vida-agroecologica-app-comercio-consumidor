// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vidaagroconsumidor/screens/screens_index.dart';
import 'package:vidaagroconsumidor/shared/components/bottomNavigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidaagroconsumidor/shared/constants/style_constants.dart';
import 'package:vidaagroconsumidor/shared/core/controllers/pedidos_controller.dart';
import 'package:vidaagroconsumidor/components/appBar/custom_app_bar.dart';
import 'package:vidaagroconsumidor/components/forms/custom_order.dart';
import 'package:vidaagroconsumidor/components/utils/vertical_spacer_box.dart';
import '../../shared/constants/app_enums.dart';
import '../../shared/core/repositories/pedidos_repository.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  int selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PedidoController>(context, listen: false).loadOrders();
    });
  }

  void _onOrderTapped(int orderId) {
    print('Pedido com id ID $orderId clicado!');
    var order = context
        .read<PedidoController>()
        .orders
        .firstWhere((order) => order.id == orderId);

    if (order.status == 'pagamento pendente' ||
        order.status == 'comprovante anexado') {
      Navigator.pushNamed(context, Screens.pagamento,
          arguments: {"orderId": orderId, "status": order.status});
    } else if (order.status == 'aguardando retirada' ||
        order.status == 'pedido enviado') {
      Navigator.pushNamed(context, Screens.marcarEnviado,
          arguments: {"orderId": orderId});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PedidoController>(
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
                  ...List.generate(controller.orders.reversed.toList().length, (index) {
                    var reversedOrders = controller.orders.reversed.toList();
                    var order = controller.orders[index];
                    return OrderCard(
                      pedidoId: order.id!,
                      orderNumber: '#${reversedOrders.length - index}', // Ajustando a numeração para ficar correta
                      sellerName: order.bancaNome ?? 'Banca Desconhecida',
                      itemsTotal: order.subtotal!,
                      date: formatDate(order.dataPedido),
                      status: order.status!,
                      onTap: () => _onOrderTapped(order.id!),
                      itens: order.listaDeProdutos!,
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
            'Você ainda não fez pedidos no aplicativo',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kDetailColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Faça pedidos agora mesmo :)',
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
