// ignore_for_file: use_build_context_synchronously

import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/core/repositories/sign_up_repository.dart';
import 'package:ecommerceassim/shared/core/models/bairro_model.dart';
import 'package:ecommerceassim/shared/core/models/cidade_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum SignUpStatus {
  done,
  error,
  loading,
  idle,
}

class SignUpController extends GetxController {
  double strength = 0;
  int infoIndex = 0;
  int bairroId = 0;
  int cidadeId = 0;
  bool? signupSuccess;
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Z].*");
  String displayText = '';
  String? errorMessage;
  String specificErrorMessage = '';
  var status = SignUpStatus.idle;

  CidadeModel? selectedCidade;
  BairroModel? selectedBairro;

  List<BairroModel> bairros = [];
  List<CidadeModel> cidades = [];
  SignUpRepository signUpRepository = SignUpRepository();

  MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  MaskTextInputFormatter cepFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _foneController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get complementoController => _complementoController;
  TextEditingController get bairroController => _bairroController;
  TextEditingController get cpfController => _cpfController;
  TextEditingController get foneController => _foneController;
  TextEditingController get ruaController => _ruaController;
  TextEditingController get cepController => _cepController;
  TextEditingController get cidadeController => _cidadeController;
  TextEditingController get numeroController => _numeroController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  @override
  void onInit() {
    super.onInit();
    loadCidades();
  }

  void loadBairros(int cidadeId) async {
    bairros = await signUpRepository.getBairrosByCidade(cidadeId);

    selectedBairro = null;

    update();
  }

  void loadCidades() async {
    cidades = await signUpRepository.getCidades();
    update();
  }

  void setCidade(CidadeModel? cidade) {
    selectedCidade = cidade;
    cidadeId = cidade?.id?.toInt() ?? 0;
    update();

    if (cidade != null) {
      loadBairros(cidadeId);
    }
  }

  void setBairro(BairroModel? bairro) {
    selectedBairro = bairro;
    bairroId = bairro?.id?.toInt() ?? 0;
    update();
  }

  void next() {
    infoIndex++;
    update();
  }

  void back() {
    infoIndex--;
    update();
  }

  void checkPasswordStrength(String password) {
    password = password.trim();
    if (password.isEmpty) {
      strength = 0;
      displayText = '';
    } else if (password.length <= 6) {
      strength = 1 / 4;
      displayText = 'Senha muito fraca';
    } else if (password.length <= 8) {
      strength = 2 / 4;
      displayText = 'Senha fraca';
    } else if (numReg.hasMatch(password) && letterReg.hasMatch(password)) {
      strength = 1;
      displayText = 'Senha muito forte';
    } else {
      strength = 3 / 4;
      displayText = 'Senha forte';
    }

    update();
  }

  void signUp(BuildContext context, formkey) async {
    status = SignUpStatus.loading;
    update();

    if (!formkey.currentState.validate()) {
      status = SignUpStatus.error;
      setErrorMessage(specificErrorMessage);
      update();
      return;
    }

    try {
      signupSuccess = await signUpRepository.signUp(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
          _foneController.text,
          _cpfController.text,
          _ruaController.text,
          _numeroController.text,
          _cepController.text,
          _complementoController.text,
          cidadeId,
          bairroId,
          context);

      if (signupSuccess == true) {
        status = SignUpStatus.done;

        await Future.delayed(const Duration(seconds: 2));
        update();

        Navigator.pushReplacementNamed(context, Screens.home);
      } else {
        throw Exception("Falha no cadastro, por favor, tente novamente.");
      }
    } catch (e) {
      status = SignUpStatus.error;
      setErrorMessage(e.toString());
      update();
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      status = SignUpStatus.idle;
      update();
    }
  }

  bool isValidPhone(String phone) {
    return phoneFormatter.getUnmaskedText().length == 11;
  }

  bool isValidCPF(String cpf) {
    return cpfFormatter.getUnmaskedText().length == 11;
  }

  bool isValidCEP(String cep) {
    return cepFormatter.getUnmaskedText().length == 8;
  }

  void setErrorMessage(String value) {
    errorMessage = value;
    update();
    Future.delayed(const Duration(seconds: 2), () {
      errorMessage = null;
      update();
    });
  }
}
