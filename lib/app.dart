import 'package:device_preview/device_preview.dart';
import 'package:ecommercebonito/screens/banca/banca_screen.dart';

import 'package:ecommercebonito/screens/first/first_screen.dart';
import 'package:ecommercebonito/screens/cesta/cart.screen.dart';
import 'package:ecommercebonito/screens/favorito/favorite_screen.dart';
import 'package:ecommercebonito/screens/favorito/favorite_seller_screen.dart';
import 'package:ecommercebonito/screens/produto/detalhes/products_details_screen.dart';
import 'package:ecommercebonito/screens/produto/products_screen.dart';
import 'package:ecommercebonito/screens/pedidos/finalizar/finalize_purchase_screen.dart';
import 'package:ecommercebonito/screens/home/home_screen.dart';
import 'package:ecommercebonito/screens/profile/editar/endereco/adress_edit_screen.dart';
import 'package:ecommercebonito/screens/profile/endereco/adress_screen.dart';
import 'package:ecommercebonito/screens/profile/editar/perfil/profile_edit_screen.dart';
import 'package:ecommercebonito/screens/profile/profile_screen.dart';
import 'package:ecommercebonito/screens/profile/endereco/select_adress_screen.dart';
import 'package:ecommercebonito/screens/signup/sign_up_screen.dart';
import 'package:ecommercebonito/shared/core/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'screens/pedidos/purchases_screen.dart';
import 'screens/signin/sign_in_screen.dart';
import 'screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowMaterialGrid: false,
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('pt, BR')],
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      navigatorKey: navigatorKey,
      builder: (context, widget) {
        return DevicePreview.appBuilder(
          context,
          widget!,
        );
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        Screens.splash: (BuildContext context) => const SplashScreen(),
        // Screens.carrousel: (BuildContext context) => const CarrouselScreen(),
        Screens.home: (BuildContext context) => const HomeScreen(),
        Screens.signin: (BuildContext context) => SignInScreen(),
        Screens.register: (BuildContext context) => const SignUpScreen(),
        Screens.first: (BuildContext context) => const FirstScreen(),
        Screens.profile: (BuildContext context) => const ProfileScreen(),
        Screens.favorite: (BuildContext context) => const FavoriteScreen(),
        Screens.purchases: (BuildContext context) => const PurchasesScreen(),
        Screens.adress: (BuildContext context) => const AddressScreen(),
        Screens.addressEdit: (BuildContext context) => const AdressEditScreen(),
        Screens.selectAdress: (BuildContext context) => const SelectAddress(),
        Screens.menuSeller: (BuildContext context) => const MenuSellerScreen(),
        Screens.menuProducts: (BuildContext context) =>
            const MenuProductsScreen(),
        Screens.cart: (BuildContext context) => const CartScreen(),

        Screens.bancas: (BuildContext context) => const Bancas(),
        Screens.produtoDetalhe: (BuildContext context) =>
            const ProdutoDetalheScreen(),
        Screens.perfilEditar: (BuildContext context) =>
            const ProfileEditScreen(),
        Screens.finalizePurchase: (BuildContext context) =>
            const FinalizePurchaseScreen(),
      },
    );
  }
}
