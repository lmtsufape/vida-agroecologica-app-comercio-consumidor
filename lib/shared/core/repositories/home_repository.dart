// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:dio/dio.dart';
import '../../constants/app_text_constants.dart';

class BancaModel {
  final int id;
  final String nome;
  final String descricao;
  final String horarioAbertura;
  final String horarioFechamento;
  final int precoMinimo;
  final String feiraId;
  final String agricultorId;

  BancaModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.horarioAbertura,
    required this.horarioFechamento,
    required this.precoMinimo,
    required this.feiraId,
    required this.agricultorId,
  });
}

class HomeScreenRepository {
  final Dio _dio = Dio();

  Future<BancaModel?> getBancaPrefs(String? userToken, String? userId) async {
    print('userId: $userId');
    print('chegou aqui');

    try {
      Response response = await _dio.get(
          '$kBaseURL/bancas/agricultores/$userId',
          options: Options(headers: {"Authorization": "Bearer $userToken"}));
      if (response.statusCode == 200) {
        BancaModel bancaModel = BancaModel(
          id: response.data["bancas"][0]["id"],
          nome: response.data["bancas"][0]["nome"].toString(),
          descricao: response.data["bancas"][0]["descricao"].toString(),
          horarioAbertura:
              response.data["bancas"][0]["horario_abertura"].toString(),
          horarioFechamento:
              response.data["bancas"][0]["horario_fechamento"].toString(),
          precoMinimo:
              int.parse(response.data["bancas"][0]["preco_minimo"].toString()),
          feiraId: response.data["bancas"][0]["feira_id"],
          agricultorId: response.data["bancas"][0]["agricultor_id"],
        );

        log('bancaModel: ${bancaModel.nome}');
        return bancaModel;
      } else {
        log('response.statusCode != 200');
        return null;
      }
    } catch (e) {
      log('Exception in getBancaPrefs: $e');
      return null;
    }
  }
}
