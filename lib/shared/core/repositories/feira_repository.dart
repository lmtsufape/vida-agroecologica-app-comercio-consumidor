import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';

import '../../constants/app_text_constants.dart';
import '../models/feira_model.dart';

class FeiraRepository {
  late String userToken;
  final Dio _dio;

  FeiraRepository(this._dio);

  Future<List<FeiraModel>> getFeiras() async {
    UserStorage userStorage = UserStorage();
    userToken = await userStorage.getUserToken();

    try {
      var response = await _dio.get('$kBaseURL/feiras',
          options: Options(
            headers: {
              "Authorization": "Bearer $userToken"
            },
          ));

      if (response.statusCode == 200) {
        /* log('Response data: ${response.data}'); */

        final jsonData = Map<String, dynamic>.from(response.data);
        final feirasJson = List.from(jsonData['feiras'])
            .map((item) => Map<String, dynamic>.from(item))
            .toList();

        List<FeiraModel> feiras = feirasJson.map((itemMap) {
          return FeiraModel.fromJson(itemMap);
        }).toList();

        return feiras;
      } else {
        throw Exception('Failed to load feiras');
      }
    } catch (error) {
      log('Error making the request: $error');
      rethrow;
    }
  }
}
