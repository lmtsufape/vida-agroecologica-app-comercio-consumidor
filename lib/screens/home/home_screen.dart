import 'package:vidaagroconsumidor/components/appBar/custom_app_bar.dart';
import 'package:vidaagroconsumidor/screens/banca/banca_screen.dart';
import 'package:vidaagroconsumidor/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:vidaagroconsumidor/shared/components/dialogs/dialog_confirmation_exit.dart';
import 'package:vidaagroconsumidor/shared/core/controllers/home_screen_controller.dart';
import 'package:vidaagroconsumidor/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => HomeScreenController(),
      builder: (context, child) => Consumer<HomeScreenController>(
        builder: (context, controller, child) => ExitAlert(
          child: Scaffold(
            appBar: const CustomAppBar(),
            bottomNavigationBar: BottomNavigation(
              paginaSelecionada: 0,
            ),
            body: Container(
              color: kOnSurfaceColor,
              width: size.width,
              padding: const EdgeInsets.all(20),
              child: const Bancas(),
            ),
          ),
        ),
      ),
    );
  }
}
