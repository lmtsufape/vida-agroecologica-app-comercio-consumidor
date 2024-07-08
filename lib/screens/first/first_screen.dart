// ignore_for_file: use_build_context_synchronously
import 'package:vidaagroconsumidor/components/buttons/custom_text_button.dart';
import 'package:vidaagroconsumidor/components/buttons/primary_button.dart';
import 'package:vidaagroconsumidor/components/utils/vertical_spacer_box.dart';
import 'package:vidaagroconsumidor/screens/screens_index.dart';
import 'package:vidaagroconsumidor/shared/components/style_bar.dart';
import 'package:vidaagroconsumidor/shared/constants/app_enums.dart';
import 'package:vidaagroconsumidor/shared/constants/app_number_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../shared/constants/style_constants.dart';
import '../../shared/core/controllers/first_controller.dart';

class FirstScreen extends StatelessWidget {
  final String? displayName;
  final FirstController? controller;
  const FirstScreen({super.key, this.displayName, this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String firstThreeWords(String? fullName) {
      if (fullName == null || fullName.isEmpty) return '';
      List<String> words = fullName.split(' ');
      return words.take(3).join(' ');
    }

    return GetBuilder<FirstController>(
      init: FirstController(),
      builder: (controller) => Scaffold(
        backgroundColor: kDetailColor,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(320),
            child: StyleBar(
              title: 'Eba, que bom que você voltou!',
              hasLeading: false,
            )),
        body: Container(
          decoration: const BoxDecoration(
            color: kOnSurfaceColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          width: size.width,
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Wrap(
                children: [
                  Text(
                    'Para começar, que tal entrar com sua conta?',
                    style: TextStyle(fontSize: 23, color: kTextFirst),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                text: "Continuar como ${firstThreeWords(controller.userName)}",
                onPressed: () {
                  Navigator.popAndPushNamed(context, Screens.home);
                },
                color: kDetailColor,
              ),
              const VerticalSpacerBox(size: SpacerSize.large),
              PrimaryButton(
                borderColor: kTextFirst,
                color: Colors.white,
                textColor: kTextFirst,
                text: 'Não sou ${firstThreeWords(controller.userName)}',
                onPressed: () {
                  Navigator.pushNamed(context, Screens.signin);
                },
              ),
              SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    /* CustomTextButton(
                      title: 'Continuar como convidado',
                      onPressed: () async {
                        Navigator.pushNamed(context, Screens.home);
                      },
                    ), */
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não possui conta?'),
                        CustomTextButton(
                          title: 'Crie aqui',
                          onPressed: () {
                            Navigator.pushNamed(context, Screens.register);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
