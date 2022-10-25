import 'package:ecommercebonito/assets/index.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:ecommercebonito/shared/constants/app_number_constants.dart';
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
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
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
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        opacity = 1;
      });
      animController.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            margin: const EdgeInsets.only(bottom: 245),
            decoration: BoxDecoration(
                color: kDetailColor, borderRadius: BorderRadius.circular(40)),
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: opacity,
                  child: Text(
                    'E-commerce BONITO'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: kTitle1.copyWith(color: kOnSurfaceColor),
                  ),
                ),
                const VerticalSpacerBox(size: SpacerSize.huge),
                const CircularProgressIndicator(
                  color: Colors.white,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Desenvolvido por:',
                  textAlign: TextAlign.center,
                  style: kBody2.copyWith(fontFamily: 'Roboto'),
                ),
                const VerticalSpacerBox(size: SpacerSize.small),
                Center(child: Image.asset(Assets.logo)),
                Text(
                  'LMTS - Laboratório Multidisciplinar de Tecnologias Sociais',
                  textAlign: TextAlign.center,
                  style: kBody2.copyWith(fontFamily: 'Roboto'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
