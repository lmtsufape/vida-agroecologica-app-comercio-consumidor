import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';
import 'package:ecommerceassim/shared/core/models/bairro_model.dart';

class BairroRepository {
  late String userToken;
  final Dio _dio;

  BairroRepository(this._dio);

  Future<List<BairroModel>> getBairros() async {
    UserStorage userStorage = UserStorage();

    userToken = await userStorage.getUserToken();

    try {
      var response = await _dio.get('$kBaseURL/bairros',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              'Cache-Control': 'no-cache',
              "Authorization": "Bearer $userToken"
            },
          ));
      if (response.statusCode == 200) {
        final List<BairroModel> bairros = [];
        final Map<String, dynamic> jsonData = response.data;
        final bairrosJson = jsonData['bairros'];
        for (var item in bairrosJson) {
          final BairroModel bairro = BairroModel.fromJson(item);
          bairros.add(bairro);
        }
        return bairros;
      } else {
        throw Exception('Não foi possível carregar os bairros.');
      }
    } catch (error) {
      throw Exception('Erro ao fazer a requisição: $error');
    }
  }
}
