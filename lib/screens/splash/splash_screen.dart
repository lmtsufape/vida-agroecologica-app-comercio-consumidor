import 'package:ecommercebonito/assets/index.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/screens/splash/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final SplashScreenController _controller;
  late final AnimationController animController;
  double opacity = 0;
  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller = SplashScreenController(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setController();
      stopController();
      _controller.initApplication(() {
        Navigator.popAndPushNamed(context, Screens.signin);
      });
    });
  }

  void setController() async {
    await animController.repeat();
  }

  void stopController() async {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 1;
      });
      animController.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(650),
        child: AppBar(
          title: const Center(
            child: Text(
              'Logo',
              style: kTitle1,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: kDetailColor,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Desenvolvido por:',
              style: kBody3,
            ),
            const VerticalSpacerBox(size: SpacerSize.small),
            Center(child: Image.asset(Assets.logo)),
          ],
        ),
      ),
    );
  }
}
