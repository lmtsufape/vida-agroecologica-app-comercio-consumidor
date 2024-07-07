class BancaModel {
  int id;
  String nome;
  String? descricao; // Make nullable if the description can be absent
  String horarioAbertura;
  String horarioFechamento;
  bool entrega;
  double precoMinimo;
  int feiraId;
  int agricultorId;
  String? pix; // Adding PIX as it is present in your JSON

  BancaModel({
    required this.id,
    required this.nome,
    this.descricao,
    required this.horarioAbertura,
    required this.horarioFechamento,
    required this.entrega,
    required this.precoMinimo,
    required this.feiraId,
    required this.agricultorId,
    this.pix,
  });

  factory BancaModel.fromJson(Map<String, dynamic> json) {
    return BancaModel(
      id: json['id'] as int,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String?,
      horarioAbertura: json['horario_abertura'] as String,
      horarioFechamento: json['horario_fechamento'] as String,
      entrega: json['entrega'] as bool,
      precoMinimo: double.parse(json['preco_minimo'] as String),
      feiraId: json['feira_id'] as int,
      agricultorId: json['agricultor_id'] as int,
      pix: json['pix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['horario_abertura'] = horarioAbertura;
    data['horario_fechamento'] = horarioFechamento;
    data['entrega'] = entrega;
    data['preco_minimo'] = precoMinimo.toString();
    data['feira_id'] = feiraId;
    data['agricultor_id'] = agricultorId;
    data['pix'] = pix;
    return data;
  }
}
