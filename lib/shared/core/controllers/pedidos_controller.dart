import 'package:ecommercebonito/shared/core/repositories/pedidos_repository.dart';
import 'package:flutter/material.dart';
import 'package:ecommercebonito/shared/core/models/pedidos_model.dart';

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
  List<PedidoModel> filteredOrders = [];

  PedidoController(this._pedidosRepository) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    status = PedidosStatus.loading;
    notifyListeners();
    try {
      orders = await _pedidosRepository.getOrders();
      filteredOrders = orders;
      status = PedidosStatus.done;
    } catch (e) {
      status = PedidosStatus.error;
    }
    notifyListeners();
  }

  void searchOrders(String query) {
    if (query.isEmpty) {
      filteredOrders = orders;
    } else {
      filteredOrders = orders
          .where((order) =>
              order.bancaNome != null &&
              order.bancaNome!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
