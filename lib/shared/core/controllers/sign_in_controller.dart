// ignore_for_file: use_build_context_synchronously

import 'package:vidaagroconsumidor/screens/screens_index.dart';
import 'package:vidaagroconsumidor/shared/core/repositories/sign_in_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SignInStatus {
  done,
  error,
  loading,
  idle,
}

class SignInController with ChangeNotifier {
  final SignInRepository _repository = SignInRepository();
  String? email;
  String? password;
  String? _userName;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;
  
  // Chave para armazenar o último email
  static const String _lastEmailKey = 'last_used_email';

  SignInController() {
    _loadLastEmail();
  }

  // Carrega o último email usado ao inicializar o controller
  Future<void> _loadLastEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final lastEmail = prefs.getString(_lastEmailKey);
    
    if (lastEmail != null) {
      _emailController.text = lastEmail;
      notifyListeners();
    }
  }

  // Salva o último email após login bem-sucedido
  Future<void> _saveLastEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastEmailKey, email);
  }

  String? get userName => _userName;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  var status = SignInStatus.idle;

  void signIn(BuildContext context) async {
    try {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        throw Exception("Por favor, forneça seu email e senha.");
      }

      status = SignInStatus.loading;
      notifyListeners();

      var loginResult = await _repository.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (loginResult == 1) {
        // Salva o último email após login bem-sucedido
        await _saveLastEmail(_emailController.text);

        status = SignInStatus.done;
        notifyListeners();

        Navigator.pushReplacementNamed(context, Screens.home);
      } else {
        status = SignInStatus.error;
        notifyListeners();
        setErrorMessage(
            "Por favor, verifique suas credenciais ou tente novamente mais tarde.");
      }
    } catch (e) {
      status = SignInStatus.loading;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 500));
      status = SignInStatus.idle;
      if (e is Exception) {
        setErrorMessage('Por favor, forneça seu email e senha.');
      } else {
        setErrorMessage('Credenciais inválidas. Verifique seus dados.');
      }
      notifyListeners();
    }
  }

  void logout(BuildContext context) {
    String? displayName = _userName ?? email?.split('@').first;

    email = null;
    password = null;
    _userName = null;
    _emailController.clear();
    _passwordController.clear();
    errorMessage = null;

    status = SignInStatus.idle;
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Você foi desconectado.'),
      ),
    );
    Navigator.pushReplacementNamed(context, Screens.first,
        arguments: displayName);
  }

  Future<void> sendResetPasswordEmail(String email) async {
    try {
      if (email.isEmpty) {
        throw Exception("Por favor, forneça seu email.");
      }

      status = SignInStatus.loading;
      notifyListeners();

      bool emailExists = await _repository.checkEmailExists(email);
      if (!emailExists) {
        throw Exception("O email fornecido não está registrado.");
      }

      await _repository.sendResetPasswordEmail(email);

      status = SignInStatus.done;
      notifyListeners();
      setErrorMessage("Email de redefinição de senha enviado com sucesso.");
    } catch (e) {
      status = SignInStatus.idle;
      notifyListeners();
      setErrorMessage(e is Exception
          ? e.toString().replaceAll('Exception: ', '')
          : 'Falha ao enviar email de redefinição de senha. Tente novamente mais tarde.');
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  void setErrorMessage(String value) async {
    errorMessage = value;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    errorMessage = null;
    notifyListeners();
  }
}