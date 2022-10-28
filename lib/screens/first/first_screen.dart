import 'package:ecommercebonito/components/buttons/custom_text_button.dart';
import 'package:ecommercebonito/components/buttons/primary_button.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/screens/signin/sign_in_controller.dart';
import 'package:ecommercebonito/shared/components/style_bar.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:ecommercebonito/shared/constants/app_number_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/constants/style_constants.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**Declare this variable to get the Media Query of the screen in the current context */
    Size size = MediaQuery.of(context).size;

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignInController()),
        ],
        builder: (context, child) {
          return Consumer<SignInController>(
            builder: (context, controller, child) => Scaffold(
              appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(320),
                  child: StyleBar(
                    title: 'Eba, que bom que você voltou!',
                    hasLeading: false,
                  )),
              body: Container(
                color: Colors.white,
                width: size.width,
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Wrap(
                      children: const [
                        Text(
                          'Para começar, que tal entrar com sua conta?',
                          style:
                              TextStyle(fontSize: 23, color: Colors.blueGrey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const Spacer(),
                    controller.status == SignInStatus.loading
                        ? const CircularProgressIndicator()
                        : PrimaryButton(
                            text: 'Continuar como Eduarda',
                            onPressed: () => controller.signIn(context),
                            color: kDetailColor,
                          ),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    PrimaryButton(
                      text: 'Não sou Eduarda',
                      onPressed: () {
                        Navigator.pushNamed(context, Screens.signin);
                      },
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          controller.errorMessage != null
                              ? Text(
                                  controller.errorMessage!,
                                  style: kCaption1,
                                )
                              : const SizedBox(),
                          const VerticalSpacerBox(size: SpacerSize.medium),
                          CustomTextButton(
                              title: 'Continuar como convidado',
                              onPressed: () {
                                Navigator.pushNamed(context, Screens.home);
                              }),
                          const VerticalSpacerBox(size: SpacerSize.small),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não possui conta?'),
                              CustomTextButton(
                                title: 'Crie aqui',
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Screens.register);
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
        });
  }
}
