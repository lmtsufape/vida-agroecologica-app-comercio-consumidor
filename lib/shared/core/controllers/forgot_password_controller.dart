import 'package:flutter/material.dart';
import 'package:ecommerceassim/shared/core/repositories/sign_in_repository.dart';

class ForgotPasswordController with ChangeNotifier {
  final SignInRepository _repository = SignInRepository();
  String? errorMessage;
  var status = ForgotPasswordStatus.idle;

  final TextEditingController emailController = TextEditingController();

  Future<void> sendResetPasswordEmail() async {
    try {
      if (emailController.text.isEmpty) {
        throw Exception("Por favor, forneça seu email.");
      }

      status = ForgotPasswordStatus.loading;
      notifyListeners();

      bool emailExists =
          await _repository.checkEmailExists(emailController.text);
      if (!emailExists) {
        throw Exception("O email fornecido não está registrado.");
      }

      await _repository.sendResetPasswordEmail(emailController.text);

      if (!emailController.hasListeners) return;
      status = ForgotPasswordStatus.done;
      notifyListeners();
      setErrorMessage("Email de redefinição de senha enviado com sucesso.");
    } catch (e) {
      if (!emailController.hasListeners) return;
      status = ForgotPasswordStatus.idle;
      notifyListeners();
      setErrorMessage(e is Exception
          ? e.toString().replaceAll('Exception: ', '')
          : 'Falha ao enviar email de redefinição de senha. Tente novamente mais tarde.');
      throw e;
    }
  }

  void setErrorMessage(String value) async {
    errorMessage = value;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    if (!emailController.hasListeners) return;
    errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

enum ForgotPasswordStatus {
  idle,
  loading,
  done,
  error,
}
