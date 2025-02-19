import 'package:vidaagroconsumidor/shared/core/models/produtos_pedidos_model.dart';

class PedidoModel {
  int? id;
  String? status;
  String? tipoEntrega;
  double? subtotal;
  double? taxaEntrega;
  double? total;
  DateTime? dataPedido;
  DateTime? dataConfirmacao;
  DateTime? dataCancelamento;
  DateTime? dataPagamento;
  DateTime? dataEnvio;
  DateTime? dataEntrega;
  int? formaPagamentoId;
  int consumidorId;
  int? bancaId;
  String? bancaNome;
  List<ProdutoPedidoModel>? listaDeProdutos;

  PedidoModel({
    this.id,
    this.status,
    this.tipoEntrega,
    this.subtotal,
    this.taxaEntrega,
    this.total,
    this.dataPedido,
    this.dataConfirmacao,
    this.dataCancelamento,
    this.dataPagamento,
    this.dataEnvio,
    this.dataEntrega,
    this.formaPagamentoId,
    required this.consumidorId,
    this.listaDeProdutos,
    this.bancaId,
    this.bancaNome,
  });

  factory PedidoModel.fromJson(Map<String, dynamic> json) {
    List<ProdutoPedidoModel> listaTemp = [];
    if (json['itens'] != null) {
      List<dynamic> itens = json['itens'];
      for (var item in itens) {
        ProdutoPedidoModel produto = ProdutoPedidoModel(
          id: item['id'],
          tipoUnidade: item['tipo_medida'],
          quantidade: item['quantidade'],
          preco: double.parse(item['preco'].toString()),
          titulo: item['produto']?['titulo']?.toString() ?? '',
        );
        listaTemp.add(produto);
      }
    }
    int? parseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is String) {
        return int.tryParse(value);
      }
      return null;
    }

    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) {
        return double.tryParse(value) ?? 0.0;
      }
      return 0.0;
    }

    DateTime? parseDate(dynamic value) {
      if (value == null) return null;
      if (value is String) {
        return DateTime.tryParse(value);
      }
      return null;
    }

    final data = json['venda'] ?? json;

    if (data['id'] == null) {
      throw Exception('ID do pedido está ausente.');
    }

    return PedidoModel(
      status: data['status'] ?? 'Desconhecido',
      tipoEntrega: data['tipo_entrega'] ?? 'Desconhecido',
      dataPedido: parseDate(data['data_pedido']),
      consumidorId: json['consumidor_id'],
      bancaId: parseInt(data['banca_id']),
      formaPagamentoId: parseInt(data['forma_pagamento_id']),
      id: parseInt(data['id'])!,
      subtotal: parseDouble(data['subtotal']),
      taxaEntrega: parseDouble(data['taxa_entrega']),
      total: parseDouble(data['total']),
      dataConfirmacao: parseDate(data['data_confirmacao']),
      dataCancelamento: parseDate(data['data_cancelamento']),
      dataPagamento: parseDate(data['data_pagamento']),
      dataEnvio: parseDate(data['data_envio']),
      dataEntrega: parseDate(data['data_entrega']),
      bancaNome: data['banca_nome'],
      listaDeProdutos: listaTemp,
    );
  }
}
