// ignore_for_file: avoid_print

import 'package:vidaagroconsumidor/shared/core/models/banca_model.dart';
import 'package:vidaagroconsumidor/shared/core/repositories/banca_repository.dart';
import 'package:vidaagroconsumidor/shared/core/user_storage.dart';
import 'package:flutter/material.dart';

class BancaController with ChangeNotifier {
  List<BancaModel?> _bancas = [];
  List<BancaModel?> _allBancas = []; // Lista completa de bancas
  final BancaRepository _bancaRepository = BancaRepository();
  UserStorage userStorage = UserStorage();
  String? userToken;

  Future getUserToken() async {
    userToken = await userStorage.getUserToken();
  }

  List<BancaModel?> get bancas => _bancas;

  Future<void> loadBancas() async {
  try {
    _allBancas = await _bancaRepository.getBancas();
    _bancas = _allBancas;

    // Debug: Verificar se o campo Pix está presente nos dados
    for (var banca in _bancas) {
      print('Banca: ${banca?.nome}, Pix: ${banca?.pix}');
    }

    notifyListeners();
  } catch (error) {
    print('Erro ao carregar as bancas: $error');
  }
}


  void searchBancas(String query) {
    if (query.isEmpty) {
      _bancas = _allBancas;
    } else {
      _bancas = _allBancas.where((banca) {
        return banca!.nome.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void onInit() {
    loadBancas();
    getUserToken();
    notifyListeners();
  }
}
