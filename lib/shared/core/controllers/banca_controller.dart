// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:ecommercebonito/shared/core/models/banca_model.dart';
import 'package:ecommercebonito/shared/core/repositories/banca_repository.dart';
import 'package:flutter/material.dart';

class BancaController with ChangeNotifier {
  List<BancaModel> _bancas = [];
  final BancaRepository _bancaRepository = BancaRepository(Dio());

  List<BancaModel> get bancas => _bancas;

  Future<void> loadBancas() async {
    try {
      _bancas = await _bancaRepository.getBancas();
      notifyListeners();
    } catch (error) {
      print('Erro ao carregar as bancas: $error');
    }
  }
}
