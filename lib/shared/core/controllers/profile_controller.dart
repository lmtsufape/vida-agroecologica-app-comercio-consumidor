// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/models/endereco_model.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';

class ProfileController with ChangeNotifier {
  List<AddressModel> addresses = [];
  Map<int, String> bairros = {};
  Map<int, String> cidades = {};
  Map<int, int> bairroToCidadeId = {};

  final UserStorage _userStorage = UserStorage();

  Future<void> fetchUserAddresses() async {
    Dio dio = Dio();
    try {
      String? userToken = await _userStorage.getUserToken();
      if (userToken.isEmpty) {
        print('Token de usuário não encontrado.');
        return;
      }
      await _fetchBairros(dio, userToken);
      await _fetchCidades(dio, userToken);
      Response response = await dio.get(
        '$kBaseURL/users/enderecos',
        options: Options(headers: {'Authorization': 'Bearer $userToken'}),
      );

      if (response.statusCode == 200) {
        List<dynamic> addressesData = response.data;
        addresses = addressesData.map((json) {
          var address = AddressModel.fromJson(json);
          int bairroId = address.bairroId;
          address.bairroNome = bairros[bairroId];
          int? cidadeId = bairroToCidadeId[bairroId];
          address.cidadeId = cidadeId;
          address.cidadeNome = cidadeId != null ? cidades[cidadeId] : null;
          return address;
        }).toList();
        notifyListeners();
      } else {
        print('Erro ao buscar endereços: Status code ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar endereços: $e');
    }
  }

  Future<void> _fetchBairros(Dio dio, String userToken) async {
    try {
      Response response = await dio.get(
        '$kBaseURL/bairros',
        options: Options(headers: {'Authorization': 'Bearer $userToken'}),
      );

      if (response.statusCode == 200) {
        List<dynamic> bairrosData = response.data['bairros'];
        for (var bairro in bairrosData) {
          bairros[bairro['id']] = bairro['nome'];
          bairroToCidadeId[bairro['id']] = bairro['cidade_id'];
        }
      } else {
        print('Erro ao buscar bairros: Status code ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar bairros: $e');
    }
  }

  Future<void> _fetchCidades(Dio dio, String userToken) async {
    try {
      Response response = await dio.get(
        '$kBaseURL/cidades',
        options: Options(headers: {'Authorization': 'Bearer $userToken'}),
      );

      if (response.statusCode == 200) {
        List<dynamic> cidadesData = response.data['cidades'];
        for (var cidade in cidadesData) {
          cidades[cidade['id']] = cidade['nome'];
        }
      } else {
        print('Erro ao buscar cidades: Status code ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar cidades: $e');
    }
  }
}
