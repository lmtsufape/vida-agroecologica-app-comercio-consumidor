class CidadeModel {
  int? id;
  String? nome;

  CidadeModel({this.id, this.nome});

  CidadeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;

    return data;
  }
}
