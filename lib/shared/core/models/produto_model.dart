class ProdutoModel {
  int id;
  String descricao;
  String titulo;
  String tipoUnidade;
  int estoque;
  String preco;
  String custo;
  bool disponivel;
  int bancaId;
  String categoria;
  int produtoTabeladoId;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt; // Pode ser nulo

  ProdutoModel({
    required this.id,
    required this.descricao,
    required this.titulo,
    required this.tipoUnidade,
    required this.categoria,
    required this.estoque,
    required this.preco,
    required this.custo,
    required this.disponivel,
    required this.bancaId,
    required this.produtoTabeladoId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      id: json['id'],
      descricao: json['descricao'],
      titulo: json['titulo'],
      tipoUnidade: json['tipo_medida'],
      estoque: int.parse(json['estoque']),
      preco: json['preco'],
      custo: json['custo'],
      disponivel: json['disponivel'],
      categoria: json['categoria'],
      bancaId: json['banca_id'],
      produtoTabeladoId: json['produto_tabelado_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['descricao'] = descricao;
    data['titulo'] = titulo;
    data['tipo_medida'] = tipoUnidade;
    data['categoria'] = categoria;
    data['estoque'] = estoque.toString();
    data['preco'] = preco;
    data['custo'] = custo;
    data['disponivel'] = disponivel;
    data['banca_id'] = bancaId;
    data['produto_tabelado_id'] = produtoTabeladoId;
    data['created_at'] = createdAt.toIso8601String();
    data['updated_at'] = updatedAt.toIso8601String();
    data['deleted_at'] = deletedAt?.toIso8601String();
    return data;
  }
}
