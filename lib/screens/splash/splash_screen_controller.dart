import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/core/navigator.dart';
import 'package:ecommercebonito/shared/core/preferences_manager.dart';
import 'package:ecommercebonito/shared/core/user_storage.dart';

class SplashScreenController {
  final BuildContext context;
  bool isFirstTime = false;
  SplashScreenController(this.context);
  final Logger _logger =
      Logger('Splash screen logger'); //a logger is always good to have
  final userStorage = UserStorage();

  void initApplication(Function onComplete) async {
    Navigator.pushNamed(context, Screens.first);
  }

  Future configDefaultAppSettings() async {
    _logger.config('Configuring default app settings...');
    const String loadedKey = 'loadedFirstTime';
    final prefs = await SharedPreferences.getInstance();
    PreferencesManager.saveIsFirstTime();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _logger.fine('Default app settings configured!');
    final bool? isFirstTime = prefs.getBool(loadedKey);
    if (isFirstTime != null && isFirstTime) {
      log('First time user in: carrosel');
      navigatorKey.currentState!.pushNamed(Screens.signin);
    } else {
      log('User already open app: sign in or home');
      return;
    }
  }
}
