import 'package:ecommerceassim/shared/validation/validate_mixin.dart';
import 'package:flutter/material.dart';
import '../../../components/forms/custom_text_form_field.dart';
import '../../../components/utils/vertical_spacer_box.dart';
import '../../../shared/constants/app_enums.dart';
import '../../../shared/core/controllers/sign_up_controller.dart';

// ignore: must_be_immutable
class InfoFirstScreen extends StatelessWidget with ValidationMixin {
  late SignUpController controller;
  late ValidationMixin validate;

  InfoFirstScreen(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            hintText: 'Nome',
            icon: Icons.person,
            controller: controller.nameController,
            validateForm: (value) => isValidName(value)),
        const VerticalSpacerBox(size: SpacerSize.small),
        CustomTextFormField(
            hintText: 'CPF',
            keyboardType: TextInputType.number,
            icon: Icons.description,
            maskFormatter: controller.cpfFormatter,
            controller: controller.cpfController,
            validateForm: (value) => isValidCpf(value)),
        const VerticalSpacerBox(size: SpacerSize.small),
        CustomTextFormField(
            hintText: 'E-mail',
            icon: Icons.email,
            controller: controller.emailController,
            validateForm: (value) => isValidEmail(value)),
        const VerticalSpacerBox(size: SpacerSize.small),
        CustomTextFormField(
            hintText: 'Telefone',
            keyboardType: TextInputType.number,
            maskFormatter: controller.phoneFormatter,
            icon: Icons.phone,
            controller: controller.foneController,
            validateForm: (value) => isValidPhone(value)),
        const VerticalSpacerBox(size: SpacerSize.small),
        CustomTextFormField(
            hintText: 'Senha',
            onChanged: (value) => controller
                .checkPasswordStrength(controller.passwordController.text),
            isPassword: true,
            icon: Icons.lock,
            controller: controller.passwordController,
            validateForm: (value) => isValidPassword(value)),
        const VerticalSpacerBox(size: SpacerSize.small),
        Visibility(
          visible: controller.passwordController.text.isNotEmpty,
          child: Column(
            children: [
              LinearProgressIndicator(
                value: controller.strength,
                backgroundColor: Colors.grey.withOpacity(0.1),
                color: controller.strength <= 1 / 4
                    ? Colors.red
                    : controller.strength == 2 / 4
                        ? Colors.yellow
                        : controller.strength == 3 / 4
                            ? Colors.blue
                            : Colors.green,
                minHeight: 15,
              ),
              Text(
                controller.displayText,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
        const VerticalSpacerBox(size: SpacerSize.small),
      ],
    );
  }
}
