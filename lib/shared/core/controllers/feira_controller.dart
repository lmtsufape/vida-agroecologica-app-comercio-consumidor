// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/controllers/bairro_controller.dart';
import 'package:ecommerceassim/shared/core/models/feira_model.dart';
import 'package:ecommerceassim/shared/core/repositories/feira_repository.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';
import 'package:flutter/material.dart';

class FeiraController with ChangeNotifier {
  final BairroController _bairroController;

  FeiraController(this._bairroController);

  List<FeiraModel> _feiras = [];

  List<FeiraModel> get feiras => _feiras;

  final bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> loadFeiras() async {
    Dio dio = Dio();

    FeiraRepository feiraRepository = FeiraRepository(dio);

    try {
      _feiras = await feiraRepository.getFeiras();
      notifyListeners();
    } catch (error) {
      print('Erro ao carregar as feiras: $error');
    }
  }

  Future<void> searchFeiras(String query) async {
    UserStorage userStorage = UserStorage();
    String userToken = await userStorage.getUserToken();

    if (query.isEmpty) {
      await loadFeiras();
      return;
    }

    try {
      var options = Options(headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Cache-Control': 'no-cache',
        "Authorization": "Bearer $userToken",
      });

      var response =
          await Dio().get('$kBaseURL/feiras/search?q=$query', options: options);

      if (response.statusCode == 200) {
        var json = response.data;
        if (json['feiras'].isEmpty) {
          _feiras = [];
          print('Nenhuma feira encontrada para a busca: $query');
        } else {
          _feiras = List<FeiraModel>.from(
              json['feiras'].map((x) => FeiraModel.fromJson(x)));
        }
      } else {
        _feiras = [];
        print('Erro ao buscar feiras: Status ${response.statusCode}');
      }
    } catch (error) {
      print('Erro na busca de feiras: $error');
      _feiras = [];
    }
    notifyListeners();
  }

  Future<void> loadFeirasByCidadeId(int cidadeId) async {
    UserStorage userStorage = UserStorage();
    String userToken = await userStorage.getUserToken();
    Dio dio = Dio();
    try {
      var bairrosResponse = await dio.get(
        '$kBaseURL/bairros/cidade/$cidadeId',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            'Cache-Control': 'no-cache',
            "Authorization": "Bearer $userToken"
          },
        ),
      );

      if (bairrosResponse.statusCode == 200) {
        final bairrosJson = List.from(bairrosResponse.data['bairros']);
        final List<int> bairroIds =
            bairrosJson.map((bairro) => bairro['id'] as int).toList();

        // print("IDs dos Bairros: $bairroIds");

        var feirasResponse = await dio.get(
          '$kBaseURL/feiras',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              'Cache-Control': 'no-cache',
              "Authorization": "Bearer $userToken"
            },
          ),
        );

        if (feirasResponse.statusCode == 200) {
          final feirasJson = List.from(feirasResponse.data['feiras'])
              .map((feira) => FeiraModel.fromJson(feira))
              .toList();

          /*  print(
              "Feiras antes da filtragem: ${feirasJson.map((feira) => feira.bairroId).toList()}");
 */
          _feiras = feirasJson
              .where((feira) => bairroIds.contains(feira.bairroId))
              .toList();

          /*  print(
              "Feiras após a filtragem: ${_feiras.map((feira) => feira.bairroId).toList()}");
 */
          notifyListeners();
        } else {
          print('Erro ao carregar feiras: ${feirasResponse.statusCode}');
          throw Exception('Failed to load feiras');
        }
      } else {
        print('Erro ao carregar bairros: ${bairrosResponse.statusCode}');
        throw Exception('Failed to load bairros');
      }
    } catch (error) {
      print('Erro ao carregar as feiras e bairros: $error');
      rethrow;
    }
  }

  String getBairroNome(int bairroId) {
    return _bairroController.getBairroNome(bairroId);
  }
}
