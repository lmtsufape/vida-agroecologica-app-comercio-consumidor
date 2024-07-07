import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/models/table_products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/core/navigator.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController {
  final BuildContext context;
  bool isFirstTime = false;
  SplashScreenController(this.context);
  final Logger _logger =
      Logger('Splash screen logger');
  final userStorage = UserStorage();

  void initApplication(Function onComplete) async {
    await Future.delayed(const Duration(seconds: 3), () {
      getTableProducts();
      onComplete.call();
    });
    await configDefaultAppSettings();
  }

  Future configDefaultAppSettings() async {
    _logger.config('Configuring default app settings...');
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (await userStorage.userHasCredentials()) {
      navigatorKey.currentState!.popAndPushNamed(Screens.first);
    } else {
      // ignore: use_build_context_synchronously
      navigatorKey.currentState!.popAndPushNamed(Screens.signin);
    }
  }

  Future<bool> userHasToken() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final token = prefs.getString('token');
    if (token != null) {
      log('user has token' as num);
      log(email! as num);
      log(token as num);
      return true;
    } else {
      log('user has no token' as num);
      return false;
    }
  }

  void getTableProducts() async {
    Dio dio = Dio();
    UserStorage userStorage = UserStorage();
    List<TableProductsModel> products = [];

    var userToken = await userStorage.getUserToken();

    var response = await dio.get('$kBaseURL/produtos/tabelados',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $userToken"
          },
        ));

    List<dynamic> responseData = response.data['produtos'];
    for (int i = 0; i < responseData.length; i++) {
      var product = TableProductsModel.fromJson(responseData[i]);
      products.add(product);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listProducts =
        products.map((product) => json.encode(product.toJson())).toList();
    prefs.setStringList('listaProdutosTabelados', listProducts);
  }
}
