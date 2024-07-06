import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/models/pedidos_model.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';

class PedidosRepository {
  late String userToken;
  late String userId;
  final Dio _dio;

  PedidosRepository(this._dio);

  Future<List<PedidoModel>> getOrders() async {
    UserStorage userStorage = UserStorage();
    userToken = await userStorage.getUserToken();
    userId = await userStorage.getUserId();

    log('Sending request with token: $userToken'); // Log do token

    try {
      var response = await _dio.get('$kBaseURL/transacoes/$userId/compras',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              'Cache-Control': 'no-cache',
              "Authorization": "Bearer $userToken"
            },
          ));

      if (response.statusCode == 200) {
        /*  log('Response data: ${response.data}'); */

        if (response.data['compras'] != null) {
          final jsonData = Map<String, dynamic>.from(response.data);
          final ordersJson = List.from(jsonData['compras'])
              .map((item) => Map<String, dynamic>.from(item))
              .toList();

          List<PedidoModel> orders = [];
          for (var orderJson in ordersJson) {
            var order = PedidoModel.fromJson(orderJson);
            order.bancaNome = await fetchBancaName(order.bancaId);
            orders.add(order);
          }

          // Ordenar os pedidos pela data
          orders.sort((a, b) => a.dataPedido!.compareTo(b.dataPedido!));

          return orders;
        } else {
          log('No compras data available.');
          return [];
        }
      } else {
        throw Exception(
            'Falha em carregar os pedidos. Status code: ${response.statusCode}');
      }
    } catch (error) {
      log('Error making the request: $error');
      rethrow;
    }
  }

  Future<String> fetchBancaName(int bancaId) async {
    try {
      var response = await _dio.get('$kBaseURL/bancas',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              'Cache-Control': 'no-cache',
              "Authorization": "Bearer $userToken"
            },
          ));
      if (response.statusCode == 200) {
        var bancasData =
            List<Map<String, dynamic>>.from(response.data['bancas']);
        var banca = bancasData.firstWhere((b) => b['id'] == bancaId,
            orElse: () => <String, dynamic>{});
        return banca.isNotEmpty ? banca['nome'] : 'Banca Desconhecida';
      } else {
        log('Falha em carregar as bancas. Código do Status: ${response.statusCode}');
        return 'Banca Desconhecida';
      }
    } catch (error) {
      log('Erro em buscar o nome da banca: $error');
      return 'Banca Desconhecida';
    }
  }
}
