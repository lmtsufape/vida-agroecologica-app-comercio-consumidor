class BancaModel {
  int id;
  String nome;
  String descricao;
  String horarioAbertura;
  String horarioFechamento;
  int feiraId;
  int agricultorId;
  double precoMinimo;
  bool entrega;

  BancaModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.horarioAbertura,
    required this.horarioFechamento,
    required this.feiraId,
    required this.agricultorId,
    required this.precoMinimo,
    required this.entrega,
  });

  factory BancaModel.fromJson(Map<String, dynamic> json) {
    return BancaModel(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      horarioAbertura: json['horario_abertura'],
      horarioFechamento: json['horario_fechamento'],
      feiraId: json['feira_id'],
      agricultorId: json['agricultor_id'],
      precoMinimo: double.parse(json['preco_minimo']),
      entrega: json['entrega'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['horario_abertura'] = horarioAbertura;
    data['horario_fechamento'] = horarioFechamento;
    data['feira_id'] = feiraId;
    data['agricultor_id'] = agricultorId;
    data['preco_minimo'] = precoMinimo.toString();
    data['entrega'] = entrega;
    return data;
  }
}
