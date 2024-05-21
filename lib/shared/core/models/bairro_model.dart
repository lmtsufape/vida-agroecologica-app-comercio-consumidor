class BairroModel {
  int? id;
  String? nome;
  int? cidadeId;

  BairroModel({this.id, this.nome, this.cidadeId});

  BairroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cidadeId = json['cidade_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cidade_id'] = cidadeId;
    return data;
  }
}
