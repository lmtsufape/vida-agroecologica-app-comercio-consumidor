import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidaagroconsumidor/screens/forgot-password/forgot_password_screen.dart';
import 'package:vidaagroconsumidor/screens/screens_index.dart';
import 'package:vidaagroconsumidor/screens/signin/sign_in_controller.dart'; // Novo import
import 'package:vidaagroconsumidor/shared/components/header_start_app/header_start_app.dart';
import 'package:vidaagroconsumidor/shared/constants/app_enums.dart';
import 'package:vidaagroconsumidor/shared/constants/app_number_constants.dart';
import 'package:vidaagroconsumidor/shared/constants/style_constants.dart';
import 'package:vidaagroconsumidor/components/buttons/custom_text_button.dart';
import 'package:vidaagroconsumidor/components/forms/custom_text_form_field.dart';
import 'package:vidaagroconsumidor/components/utils/vertical_spacer_box.dart';
import 'package:vidaagroconsumidor/shared/validation/validate_mixin.dart';

class SignInScreen extends StatelessWidget with ValidationMixin {
 SignInScreen({super.key}); // Removido formkey e adicionado const

 @override
 Widget build(BuildContext context) {
   return ChangeNotifierProvider(
     create: (_) => SignInController(),
     child: Consumer<SignInController>(
       builder: (context, controller, child) => Scaffold(
         resizeToAvoidBottomInset: true,
         backgroundColor: kPrimaryColor,
         body: Column(
           children: [
             Expanded(
               flex: 2,
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.only(top: 35),
                   child: Container(
                     child: const HeaderStartApp(Colors.white),
                   ),
                 ),
               ),
             ),
             Expanded(
               flex: 3,
               child: Container(
                 alignment: Alignment.center,
                 decoration: const BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(35), 
                     topRight: Radius.circular(35),
                   )
                 ),
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.all(kDefaultPadding),
                     child: Form(
                       key: controller.formKey, // Usando formKey do controller
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: [
                           Text(
                             'Entrar',
                             style: kTitle.copyWith(color: kTextSign, fontWeight: FontWeight.w700),
                             textAlign: TextAlign.center,
                           ),
                           const VerticalSpacerBox(size: SpacerSize.huge),
                           CustomTextFormField(
                             hintText: 'E-mail',
                             icon: Icons.email,
                             controller: controller.emailController,
                             validateForm: (value) => isValidEmail(value),
                           ),
                           const VerticalSpacerBox(size: SpacerSize.small),
                           CustomTextFormField(
                             hintText: 'Senha',
                             isPassword: true,
                             icon: Icons.lock,
                             controller: controller.passwordController,
                             validateForm: (value) => isValidPassword(value),
                           ),
                           Align(
                             alignment: Alignment.centerRight,
                             child: CustomTextButton(
                               title: 'Esqueceu a senha?',
                               onPressed: () {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => ForgotPasswordScreen(),
                                   ),
                                 );
                               },
                             ),
                           ),
                           const VerticalSpacerBox(size: SpacerSize.medium),
                           if (controller.status == SignInStatus.loading)
                             const Center(
                               child: CircularProgressIndicator(color: kDetailColor),
                             )
                           else
                             ElevatedButton(
                               onPressed: () {
                                 if (controller.formKey.currentState!.validate()) {
                                   controller.signIn(context);
                                 }
                               },
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: kDetailColor,
                                 shape: const RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(10)),
                                 ),
                                 padding: const EdgeInsets.symmetric(vertical: 12),
                                 textStyle: const TextStyle(
                                     fontSize: 18, fontWeight: FontWeight.w500),
                               ),
                               child: const Text(
                                 'Entrar',
                                 style: TextStyle(
                                   color: Colors.white,
                                 ),
                               ),
                             ),
                           const VerticalSpacerBox(size: SpacerSize.medium),
                           if (controller.errorMessage != null)
                             Text(
                               controller.errorMessage!,
                               style: kCaption1,
                               textAlign: TextAlign.center,
                             ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               const Text('Não possui conta?'),
                               CustomTextButton(
                                 title: 'Crie aqui',
                                 onPressed: () =>
                                     Navigator.pushNamed(context, Screens.register),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),
     ),
   );
 }
}