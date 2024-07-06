import 'package:ecommerceassim/shared/validation/validate_mixin.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceassim/shared/core/controllers/sign_up_controller.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import '../../components/buttons/custom_text_button.dart';
import '../../components/buttons/primary_button.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../screens_index.dart';
import 'components/info_first_screen.dart';
import 'components/info_second_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

// ignore: recursive_getters
  GlobalKey<FormState> get formkey => formkey;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ValidationMixin {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: kOnSurfaceColor,
          iconTheme: const IconThemeData(color: kDetailColor),
          elevation: 0,
        ),
        backgroundColor: kOnSurfaceColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const VerticalSpacerBox(size: SpacerSize.large),
                    Text(
                      controller.infoIndex == 0 ? 'Cadastro' : 'Endereço',
                      style: kTitle2.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: kSecondaryDarkColor,
                      ),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    if (controller.infoIndex == 0) InfoFirstScreen(controller),
                    if (controller.infoIndex == 1) InfoSecondScreen(controller),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    if (controller.status == SignUpStatus.loading)
                      const Center(
                        child: CircularProgressIndicator(color: kDetailColor),
                      ),
                    if (controller.status != SignUpStatus.loading)
                      PrimaryButton(
                        text:
                            controller.infoIndex == 0 ? 'Próximo' : 'Concluir',
                        onPressed: () {
                          if (formkey.currentState?.validate() == true) {
                            if (controller.infoIndex == 0) {
                              controller.next();
                            } else {
                              controller.signUp(context, formkey);
                            }
                          }
                        },
                        color: kDetailColor,
                      ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    if (controller.errorMessage != null)
                      Text(
                        controller.errorMessage!,
                        style: kCaption1,
                        textAlign: TextAlign.center,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Já possui conta?'),
                        CustomTextButton(
                          title: 'Entre aqui',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Screens.signin);
                          },
                        ),
                      ],
                    ),
                    if (controller.infoIndex == 1)
                      Center(
                        child: CustomTextButton(
                            onPressed: () => {controller.back()},
                            title: 'Anterior'),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
