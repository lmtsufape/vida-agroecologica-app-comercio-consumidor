import 'package:ecommerceassim/shared/core/repositories/pedidos_repository.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/shared/core/models/pedidos_model.dart';

enum PedidosStatus {
  done,
  error,
  loading,
  idle,
}

class PedidoController with ChangeNotifier {
  final PedidosRepository _pedidosRepository;

  PedidosStatus status = PedidosStatus.idle;
  List<PedidoModel> orders = [];

  PedidoController(this._pedidosRepository) {
    loadOrders();
  }

  void updateOrderStatus(int orderId, String status) {
    final index = orders.indexWhere((order) => order.id == orderId);
    if (index != -1) {
      orders[index].status = status;
      notifyListeners();
    }
  }

  Future<void> loadOrders() async {
    status = PedidosStatus.loading;
    notifyListeners();
    try {
      orders = await _pedidosRepository.getOrders();
      if (orders.isEmpty) {
        status = PedidosStatus.done;
      } else {
        status = PedidosStatus.done;
      }
    } catch (e) {
      status = PedidosStatus.error;
    }
    notifyListeners();
  }
}
