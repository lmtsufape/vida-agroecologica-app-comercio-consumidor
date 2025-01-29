import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:device_preview/device_preview.dart';
import 'package:vidaagroconsumidor/screens/banca/banca_screen.dart';
import 'package:vidaagroconsumidor/screens/cesta/cart.screen.dart';
import 'package:vidaagroconsumidor/screens/favorito/favorite_screen.dart';
import 'package:vidaagroconsumidor/screens/favorito/favorite_seller_screen.dart';
import 'package:vidaagroconsumidor/screens/first/first_screen.dart';
import 'package:vidaagroconsumidor/screens/forgot-password/forgot_password_screen.dart';
import 'package:vidaagroconsumidor/screens/home/home_screen.dart';
import 'package:vidaagroconsumidor/screens/pedidos/finalizar/finalize_purchase_screen.dart';
import 'package:vidaagroconsumidor/screens/pedidos/mark_delivery_screen.dart';
import 'package:vidaagroconsumidor/screens/pedidos/payment_screen.dart';
import 'package:vidaagroconsumidor/screens/pedidos/purchases_screen.dart';
import 'package:vidaagroconsumidor/screens/produto/detalhes/products_details_screen.dart';
import 'package:vidaagroconsumidor/screens/produto/products_screen.dart';
import 'package:vidaagroconsumidor/screens/profile/editar/endereco/adress_edit_screen.dart';
import 'package:vidaagroconsumidor/screens/profile/editar/perfil/profile_edit_screen.dart';
import 'package:vidaagroconsumidor/screens/profile/endereco/adress_screen.dart';
import 'package:vidaagroconsumidor/screens/profile/endereco/select_adress_screen.dart';
import 'package:vidaagroconsumidor/screens/profile/profile_screen.dart';
import 'package:vidaagroconsumidor/screens/signup/sign_up_screen.dart';
import 'package:vidaagroconsumidor/shared/core/controllers/pagamento_controller.dart';
import 'package:vidaagroconsumidor/shared/core/controllers/pedidos_controller.dart';
import 'package:vidaagroconsumidor/shared/core/models/banca_model.dart';
import 'package:vidaagroconsumidor/shared/core/models/cart_model.dart';
import 'package:vidaagroconsumidor/shared/core/navigator.dart';
import 'package:vidaagroconsumidor/shared/core/repositories/pagamento_repository.dart';
import 'package:vidaagroconsumidor/shared/core/repositories/pedidos_repository.dart';
import 'screens/screens_index.dart';
import 'screens/signin/sign_in_screen.dart';
import 'screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PedidoController(PedidosRepository(Dio())),
        ),
      ],
      child: GetMaterialApp(
        debugShowMaterialGrid: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('pt', 'BR')],
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
          Screens.menuProducts: (BuildContext context) => const MenuProductsScreen(),
          Screens.cart: (BuildContext context) => const CartScreen(),
          Screens.bancas: (BuildContext context) => const Bancas(),
          Screens.produtoDetalhe: (BuildContext context) => const ProdutoDetalheScreen(),
          Screens.recuperarSenha: (BuildContext context) => ForgotPasswordScreen(),
          Screens.perfilEditar: (BuildContext context) => const ProfileEditScreen(),
          Screens.pagamento: (BuildContext context) => ChangeNotifierProvider(
                create: (_) => PagamentoController(PagamentoRepository()),
                child: const PaymentScreen(),
              ),
          Screens.finalizePurchase: (BuildContext context) {
            final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

            // Como os items já são CartModel, podemos fazer um cast direto
            final List<CartModel> cartItems = args['cartItems'] as List<CartModel>;

            return FinalizePurchaseScreen(
              cartItems,
              banca: args['banca'] as BancaModel,
            );
          },
          Screens.marcarEnviado: (BuildContext context) {
            final args = ModalRoute.of(context)!.settings.arguments as Map<String, int>;
            return MarkAsDeliveredScreen(orderId: args['orderId']!);
          },
        },
      ),
    );
  }
}
