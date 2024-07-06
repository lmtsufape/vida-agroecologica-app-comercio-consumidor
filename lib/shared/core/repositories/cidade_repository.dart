import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/core/models/cidade_model.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';

import '../../constants/app_text_constants.dart';

class CidadeRepository {
  late String userToken;
  final Dio _dio;

  CidadeRepository(this._dio);

  Future<List<CidadeModel>> getCidades() async {
    UserStorage userStorage = UserStorage();
    userToken = await userStorage.getUserToken();

    try {
      var response = await _dio.get('$kBaseURL/cidades',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              'Cache-Control': 'no-cache',
              "Authorization": "Bearer $userToken"
            },
          ));

      if (response.statusCode == 200) {
        /* log('Response data: ${response.data}'); */

        final jsonData = Map<String, dynamic>.from(response.data);
        final cidadesJson = List.from(jsonData['cidades'])
            .map((item) => Map<String, dynamic>.from(item))
            .toList();

        List<CidadeModel> cidades = cidadesJson.map((itemMap) {
          return CidadeModel.fromJson(itemMap);
        }).toList();

        return cidades;
      } else {
        throw Exception('Failed to load cidades');
      }
    } catch (error) {
      log('Error making the request: $error');
      rethrow;
    }
  }
}
