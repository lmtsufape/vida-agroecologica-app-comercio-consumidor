// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/shared/components/dialogs/confirm_dialog.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerceassim/components/buttons/custom_text_button.dart';
import 'package:ecommerceassim/components/forms/custom_text_form_field.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/shared/constants/app_number_constants.dart';
import 'package:ecommerceassim/shared/validation/validate_mixin.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:ecommerceassim/shared/core/controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget with ValidationMixin {
  ForgotPasswordScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _showSuccessMessage(BuildContext context) async {
    confirmDialog(
      context,
      'Email Enviado',
      'Um email de redefinição de senha foi enviado para o seu endereço de email.',
      'Cancelar',
      'Ok',
      onConfirm: () {
        Navigator.of(context).pop();
      },
    );
  }

  Future<void> _showErrorMessage(BuildContext context, String message) async {
    confirmDialog(
      context,
      'Erro',
      message,
      'Cancelar',
      'Ok',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordController(),
      child: Consumer<ForgotPasswordController>(
        builder: (context, controller, child) => Scaffold(
          backgroundColor: kOnSurfaceColor,
          appBar: const CustomAppBar(
            automaticallyImplyLeading: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Esqueceu a senha?',
                      style: kTitle.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.huge),
                    CustomTextFormField(
                      hintText: 'Informe o e-mail:',
                      icon: Icons.email,
                      controller: controller.emailController,
                      validateForm: (value) => isValidEmail(value),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          controller.status = ForgotPasswordStatus.loading;
                          controller.notifyListeners();
                          try {
                            await controller.sendResetPasswordEmail();
                            if (context.mounted) {
                              controller.status = ForgotPasswordStatus.done;
                              controller.notifyListeners();
                              _showSuccessMessage(context);
                            }
                          } catch (e) {
                            if (context.mounted) {
                              controller.status = ForgotPasswordStatus.idle;
                              controller.notifyListeners();
                              _showErrorMessage(context,
                                  e.toString().replaceAll('Exception: ', ''));
                            }
                          }
                        } else {
                          controller.setErrorMessage(
                              'Por favor, forneça um email válido.');
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
                        'Recuperar senha',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    if (controller.status == ForgotPasswordStatus.loading)
                      const Center(
                        child: CircularProgressIndicator(color: kDetailColor),
                      ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    if (controller.errorMessage != null)
                      Text(
                        controller.errorMessage!,
                        style: kCaption1,
                        textAlign: TextAlign.center,
                      ),
                    CustomTextButton(
                      title: 'Cancelar',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
