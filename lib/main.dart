import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:ecommercebonito/app.dart';
import 'package:ecommercebonito/screens/cesta/cart_provider.dart';
import 'package:ecommercebonito/shared/components/bottomNavigation/bottom_navigator_controller.dart';
import 'package:ecommercebonito/shared/core/controllers/cidade_controllers.dart';
import 'package:ecommercebonito/shared/core/controllers/home_screen_controller.dart';
import 'package:ecommercebonito/shared/core/controllers/bairro_controller.dart';
import 'package:ecommercebonito/shared/core/controllers/banca_controller.dart';
import 'package:ecommercebonito/shared/core/controllers/feira_controller.dart';
import 'package:ecommercebonito/shared/core/controllers/products_controller.dart';
import 'package:ecommercebonito/shared/core/controllers/profile_controller.dart';
import 'package:ecommercebonito/shared/core/selected_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'shared/core/controllers/sign_in_controller.dart';

void setupDioWithTrustedCertificate(Dio dio) {
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data;
  try {
    data = await PlatformAssetBundle()
        .load('lib/assets/certificates/ufape-edu-br.pem');
    print("Certificado carregado com sucesso");
    SecurityContext.defaultContext
        .setTrustedCertificatesBytes(data.buffer.asUint8List());
  } catch (e) {
    print("Erro ao carregar o certificado: $e");
  }

  tz.initializeTimeZones();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  Dio dio = Dio();
  setupDioWithTrustedCertificate(dio);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenController()),
        ChangeNotifierProvider(create: (_) => SelectedItem()),
        ChangeNotifierProvider(create: (_) => BancaController()),
        ChangeNotifierProvider(create: (_) => BairroController()),
        ChangeNotifierProvider(create: (_) => SignInController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => BottomNavigationController()),
        ChangeNotifierProvider(create: (_) => CidadeController()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        Provider<ProductsController>(
          create: (_) => ProductsController(dio),
        ),
        ChangeNotifierProxyProvider2<BairroController, BancaController,
            FeiraController>(
          create: (context) =>
              FeiraController(context.read<BairroController>()),
          update: (_, bairroController, bancaController, feiraController) {
            feiraController ??= FeiraController(bairroController);
            return feiraController;
          },
        ),
      ],
      child: const App(),
    ),
  );
}
