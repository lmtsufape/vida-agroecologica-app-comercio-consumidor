import 'package:ecommercebonito/components/buttons/custom_text_button.dart';
import 'package:ecommercebonito/components/buttons/primary_button.dart';
import 'package:ecommercebonito/components/forms/custom_text_form_field.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/screens/signin/sign_in_controller.dart';
import 'package:ecommercebonito/shared/components/style_bar.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:ecommercebonito/shared/constants/app_number_constants.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignInController()),
        ],
        builder: (context, child) {
          return Consumer<SignInController>(
            builder: (context, controller, child) => Scaffold(
              appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(360),
                  child: StyleBar(
                      title: 'Bem vindo(a) ao App bonito', hasLeading: true)),
              body: Container(
                color: kOnSurfaceColor,
                width: size.width,
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Center(
                      child: Text(
                        'Cadastro',
                        style: kTitle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    CustomTextFormField(
                      hintText: 'Nome',
                      controller: controller.emailController,
                      icon: const Icon(Icons.person),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    CustomTextFormField(
                      hintText: 'E-mail',
                      controller: controller.passwordController,
                      icon: const Icon(Icons.mail),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    CustomTextFormField(
                      hintText: 'Senha',
                      controller: controller.emailController,
                      icon: const Icon(Icons.lock),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    CustomTextFormField(
                      hintText: 'Telefone',
                      controller: controller.passwordController,
                      icon: const Icon(Icons.phone),
                    ),
                    const Spacer(),
                    controller.status == SignInStatus.loading
                        ? const CircularProgressIndicator()
                        : PrimaryButton(
                            text: 'Próximo',
                            onPressed: () => Navigator.pushNamed(
                                context, Screens.registerAdress),
                            color: kDetailColor,
                          ),
                    const VerticalSpacerBox(size: SpacerSize.large),
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
                          const VerticalSpacerBox(size: SpacerSize.small),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Já possui conta?'),
                              CustomTextButton(
                                title: 'Entre aqui',
                                onPressed: () {
                                  Navigator.pushNamed(context, Screens.signin);
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
