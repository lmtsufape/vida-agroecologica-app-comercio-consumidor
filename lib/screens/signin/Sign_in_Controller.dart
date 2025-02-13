import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidaagroconsumidor/screens/screens_index.dart';
import 'sign_in_repository.dart';

enum SignInStatus {
  done,
  error,
  loading,
  idle,
}

class SignInController with ChangeNotifier {
  final SignInRepository _repository = SignInRepository();
  String? errorMessage;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var status = SignInStatus.idle;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  SignInController() {
    loadSavedEmail();
  }

  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
  }

  Future<void> loadSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('userEmail');
    if (savedEmail != null) {
      _emailController.text = savedEmail;
      notifyListeners();
    }
  }

  void setErrorMessage(String value) async {
    errorMessage = value;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    errorMessage = null;
    notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    try {
      status = SignInStatus.loading;
      notifyListeners();

      int result = (await _repository.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      )) as int;

      if (result == 1) {
        await saveEmail(_emailController.text);
        status = SignInStatus.done;
        Navigator.pushReplacementNamed(context, Screens.home);
      } else if (result == 3) {
        status = SignInStatus.error;
        setErrorMessage('Você não tem permissão para acessar este aplicativo.');
      } else {
        status = SignInStatus.error;
        setErrorMessage('Email ou senha incorretos.');
      }

    } catch (e) {
      status = SignInStatus.error;
      setErrorMessage('Erro ao realizar login. Tente novamente.');
    }
    notifyListeners();
  }
}