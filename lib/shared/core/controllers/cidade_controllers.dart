// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/shared/core/models/cidade_model.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/repositories/cidade_repository.dart';

class CidadeController with ChangeNotifier {
  final CidadeRepository _cidadeRepository = CidadeRepository(Dio());

  List<CidadeModel> _cidades = [];
  bool _hasError = false;
  List<CidadeModel> get cidades => _cidades;
  bool get hasError => _hasError;

  Future<void> loadCidades() async {
    try {
      _cidades = await _cidadeRepository.getCidades();
      notifyListeners();
    } catch (error) {
      print('Erro ao carregar as cidades: $error');
    }
  }

  Future<void> searchCidades(String query) async {
    UserStorage userStorage = UserStorage();
    String userToken = await userStorage.getUserToken();

    if (query.isEmpty) {
      await loadCidades();
      return;
    }

    try {
      var options = Options(headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Cache-Control': 'no-cache',
        "Authorization": "Bearer $userToken",
      });

      var response = await Dio()
          .get('$kBaseURL/cidades/search?q=$query', options: options);

      if (response.statusCode == 200) {
        var json = response.data;
        if (json['cidades'].isEmpty) {
          _cidades = [];
          _hasError = true;
        } else {
          _cidades = List<CidadeModel>.from(
              json['cidades'].map((x) => CidadeModel.fromJson(x)));
          _hasError = false;
        }
      } else {
        _cidades = [];
        _hasError = true;
      }
    } catch (error) {
      print('Erro na busca de cidades: $error');
      _cidades = [];
      _hasError = true;
    }
    notifyListeners();
  }
}
