class AddressModel {
  final int id;
  final String rua;
  final String numero;
  final String cep;
  final String? complemento;
  final int bairroId;
  String? bairroNome;
  int? cidadeId;
  String? cidadeNome;

  AddressModel({
    required this.id,
    required this.rua,
    required this.numero,
    required this.cep,
    this.complemento,
    required this.bairroId,
    this.bairroNome,
    this.cidadeId,
    this.cidadeNome,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      rua: json['rua'],
      numero: json['numero'],
      cep: json['cep'],
      complemento: json['complemento'],
      bairroId: json['bairro_id'],
      bairroNome: json['bairro_nome'],
      cidadeId: json['cidade_id'],
      cidadeNome: json['cidade_nome'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'rua': rua,
        'numero': numero,
        'cep': cep,
        'complemento': complemento,
        'bairro_id': bairroId,
        'bairro_nome': bairroNome,
        'cidade_id': cidadeId,
        'cidade_nome': cidadeNome,
      };
}
