class PedidoModel {
  int id;
  String status;
  String tipoEntrega;
  double subtotal;
  double taxaEntrega;
  double total;
  DateTime? dataPedido;
  DateTime? dataConfirmacao;
  DateTime? dataCancelamento;
  DateTime? dataPagamento;
  DateTime? dataEnvio;
  DateTime? dataEntrega;
  int? formaPagamentoId; // Pode ser nulo
  int? consumidorId;     // Pode ser nulo
  int? bancaId;          // Pode ser nulo
  String? bancaNome;

  PedidoModel({
    required this.id,
    required this.status,
    required this.tipoEntrega,
    required this.subtotal,
    required this.taxaEntrega,
    required this.total,
    this.dataPedido,
    this.dataConfirmacao,
    this.dataCancelamento,
    this.dataPagamento,
    this.dataEnvio,
    this.dataEntrega,
    this.formaPagamentoId,
    this.consumidorId,
    this.bancaId,
    this.bancaNome,
  });

  factory PedidoModel.fromJson(Map<String, dynamic> json) {
    // Tratamento de campos opcionais
    int? parseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is String) {
        return int.tryParse(value);
      }
      return null; // Retorna null se não for convertível
    }

    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) {
        return double.tryParse(value) ?? 0.0;
      }
      return 0.0; // Retorna 0.0 se não for convertível
    }

    DateTime? parseDate(dynamic value) {
      if (value == null) return null;
      if (value is String) {
        return DateTime.tryParse(value);
      }
      return null; // Retorna null se não for convertível
    }

    // Valida os campos obrigatórios
    if (json['venda']['id'] == null) {
      throw Exception('ID do pedido está ausente.');
    }

    // Criação do modelo com validação
    return PedidoModel(
      status: json['venda']['status'] ?? 'Desconhecido',
      tipoEntrega: json['venda']['tipo_entrega'] ?? 'Desconhecido',
      dataPedido: parseDate(json['venda']['data_pedido']),
      consumidorId: parseInt(json['venda']['consumidor_id']),
      bancaId: parseInt(json['venda']['banca_id']),
      formaPagamentoId: parseInt(json['venda']['forma_pagamento_id']),
      id: parseInt(json['venda']['id'])!,
      subtotal: parseDouble(json['venda']['subtotal']),
      taxaEntrega: parseDouble(json['venda']['taxa_entrega']),
      total: parseDouble(json['venda']['total']),
      dataConfirmacao: parseDate(json['venda']['data_confirmacao']),
      dataCancelamento: parseDate(json['venda']['data_cancelamento']),
      dataPagamento: parseDate(json['venda']['data_pagamento']),
      dataEnvio: parseDate(json['venda']['data_envio']),
      dataEntrega: parseDate(json['venda']['data_entrega']),
      bancaNome: json['venda']['banca_nome'],
    );
  }
}
