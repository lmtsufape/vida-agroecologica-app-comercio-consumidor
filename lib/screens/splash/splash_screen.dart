import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/shared/components/bottomLogos/bottom_logos.dart';
import 'package:ecommerceassim/shared/components/header_start_app/header_start_app.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/app_number_constants.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/screens/splash/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
    animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    _controller = SplashScreenController(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setController();
      stopController();
      _controller.initApplication(() {});
    });
  }

  void setController() async {
    await animController.repeat();
  }

  void stopController() async {
    Future.delayed(const Duration(milliseconds: 200), () {
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
            decoration: const BoxDecoration(
                color: kDetailColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: opacity,
                  child:  HeaderStartApp(kOnSurfaceColor)
                ),
                const VerticalSpacerBox(size: SpacerSize.huge),
                const CircularProgressIndicator(
                  color: Colors.white,
                )
              ],
            ),
          ),
          BottomLogos(150)
        ],
      ),
    );
  }
}
