import 'package:vidaagroconsumidor/shared/core/repositories/pedidos_repository.dart';
import 'package:flutter/material.dart';
import 'package:vidaagroconsumidor/shared/core/models/pedidos_model.dart';

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
    print("🚀 Iniciando PedidoController");
    loadOrders();
  }

  void updateOrderStatus(int orderId, String status) {
    print("📝 Atualizando status do pedido $orderId para: $status");
    final index = orders.indexWhere((order) => order.id == orderId);
    if (index != -1) {
      orders[index].status = status;
      notifyListeners();
    }
  }

  Future<void> loadOrders() async {
    print("⏳ Iniciando carregamento dos pedidos...");
    print("Status anterior: $status");
    
    status = PedidosStatus.loading;
    notifyListeners();

    try {
      print("📡 Fazendo requisição para o repository...");
      orders = await _pedidosRepository.getOrders();
      print("📦 Pedidos recebidos: ${orders.length}");
      
      if (orders.isEmpty) {
        print("ℹ️ Nenhum pedido encontrado");
        status = PedidosStatus.done;
      } else {
        print("✅ Pedidos carregados com sucesso");
        status = PedidosStatus.done;
      }
    } catch (e) {
      print("❌ Erro ao carregar pedidos: $e");
      status = PedidosStatus.error;
    }
    
    print("Status final: $status");
    print("Número final de pedidos: ${orders.length}");
    notifyListeners();
  }
}