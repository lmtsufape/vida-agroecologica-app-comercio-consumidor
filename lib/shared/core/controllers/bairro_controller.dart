// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/core/models/bairro_model.dart';
import 'package:ecommerceassim/shared/core/repositories/bairro_repository.dart';
import 'package:flutter/cupertino.dart';

class BairroController with ChangeNotifier {
  final BairroRepository _bairroRepository = BairroRepository(Dio());

  List<BairroModel> _bairros = [];

  List<BairroModel> get bairros => _bairros;

  Future<void> loadBairros() async {
    try {
      _bairros = await _bairroRepository.getBairros();
      notifyListeners();
    } catch (error) {
      print('Erro ao carregar os bairros: $error');
    }
  }

  String getBairroNome(int bairroId) {
    final bairro = _bairros.firstWhere((bairro) => bairro.id == bairroId);
    return bairro.nome ?? 'Bairro Desconhecido';
  }
}
