// ignore_for_file: use_build_context_synchronously

import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerceassim/shared/core/controllers/pedidos_controller.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:http/http.dart' as http;

class MarkAsDeliveredScreen extends StatelessWidget {
  final int orderId;

  const MarkAsDeliveredScreen({super.key, required this.orderId});

  Future<void> _markAsDelivered(BuildContext context, int orderId) async {
    final pedidoController =
        Provider.of<PedidoController>(context, listen: false);

    try {
      final userStorage = UserStorage();
      final token = await userStorage.getUserToken();
      final response = await http.post(
        Uri.parse('$kBaseURL/transacoes/$orderId/entregar'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        pedidoController.updateOrderStatus(orderId, 'pedido entregue');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Pedido marcado como entregue com sucesso!')),
        );
        Navigator.pop(context);
      } else {
        throw Exception('Falha ao marcar como entregue');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao marcar como entregue: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () => _markAsDelivered(context, orderId),
          style: ElevatedButton.styleFrom(
            backgroundColor: kDetailColor,
            foregroundColor: Colors.white,
          ),
          child: const Text('Marcar como entregue'),
        ),
      ),
    );
  }
}
