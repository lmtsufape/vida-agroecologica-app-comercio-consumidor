import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ecommerceassim/app.dart';
import 'package:ecommerceassim/assets/index.dart';
import 'package:ecommerceassim/screens/cesta/cart_provider.dart';
import 'package:ecommerceassim/shared/components/bottomNavigation/bottom_navigator_controller.dart';
import 'package:ecommerceassim/shared/core/controllers/bairro_controller.dart';
import 'package:ecommerceassim/shared/core/controllers/banca_controller.dart';
import 'package:ecommerceassim/shared/core/controllers/cidade_controllers.dart';
import 'package:ecommerceassim/shared/core/controllers/feira_controller.dart';
import 'package:ecommerceassim/shared/core/controllers/home_screen_controller.dart';
import 'package:ecommerceassim/shared/core/controllers/products_controller.dart';
import 'package:ecommerceassim/shared/core/controllers/profile_controller.dart';
import 'package:ecommerceassim/shared/core/selected_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'shared/core/controllers/sign_in_controller.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data = await PlatformAssetBundle().load(Assets.document);
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
  tz.initializeTimeZones();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {});
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
          create: (_) => ProductsController(Dio()),
        ),
        ChangeNotifierProxyProvider2<BairroController, BancaController,
            FeiraController>(
              create: (context) => FeiraController(context.read<BairroController>()),
          update: (_, bairroController, bancaController, feiraController) {
            feiraController ??= FeiraController(bairroController);
            return feiraController;
          },
        ),
      ],
      child: const App(),
      // DevicePreview(
      //   enabled: true,
      //   builder: (context) => const App(),
      // ),
    ),
  );
}
