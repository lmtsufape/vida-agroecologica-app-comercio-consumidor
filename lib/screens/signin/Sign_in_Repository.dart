// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:vidaagroconsumidor/shared/constants/app_text_constants.dart';
import 'package:vidaagroconsumidor/shared/core/user_storage.dart';

class SignInRepository {
  final userStorage = UserStorage();
  String userId = "0";
  String userToken = "0";
  String noAut = 'Este aplicativo é exclusivo para consumidores.';

  final _dio = Dio();

  Future<int> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$kBaseURL/sanctum/token',
        data: {
          'email': email, 
          'password': password, 
          'device_name': "PC"
        },
      );
      
      if (response.statusCode == 200) {
        if (await userStorage.userHasCredentials()) {
          await userStorage.clearUserCredentials();
        }
        
        userId = response.data['user']['id'].toString();
        userToken = response.data['token'].toString();
        
        await userStorage.saveUserCredentials(
          id: userId,
          nome: response.data['user']['name'].toString(),
          token: userToken,
          email: response.data['user']['email'].toString(),
        );

        try {
          Response userResponse = await _dio.get(
            '$kBaseURL/users/$userId',
            options: Options(headers: {"Authorization": "Bearer $userToken"}),
          );

          if (userResponse.statusCode == 200) {
            List roles = userResponse.data['user']['roles'];
            if (roles.isNotEmpty) {
              bool hasRole5 = roles.any((role) => role['id'] == 5);
              if (hasRole5) {
                print(response.statusCode);
                return 1;
              } else {
                print(noAut);
                return 3;
              }
            }
          }
        } catch (e) {
          print(e);
          return 0; // Erro ao verificar roles
        }
      }
    } catch (e) {
      log(e.toString());
      return 0; // Erro no login
    }
    return 0; // Erro genérico
  }
}