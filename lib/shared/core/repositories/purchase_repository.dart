// ignore_for_file: avoid_print, camel_case_types, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:vidaagroconsumidor/shared/constants/app_text_constants.dart';

import '../models/pedidos_model.dart';

class purchaseRepository {
  Dio dio = Dio();

  Future<PedidoModel> purchase(List<List> products, int storeId, String userToken,
      int enderecoId, String tipoEntrega, int formaPagamento) async {
    for(var product in products){
      print("PRODUTOS REPO: ${product}");
    }
    print("ID BANCA REPO: ${storeId}");
    print("TOKE REPO: ${userToken}");
    print("ENDERECO REPO: ${enderecoId}");
    print("FORMA PAGAMENTO REPO: ${formaPagamento}");
    print("TIPO ENTREGA REPO: ${tipoEntrega}");

    try {
      final response = await dio.post(
        '$kBaseURL/transacoes',
        options: Options(headers: {"Authorization": "Bearer $userToken"}),
        data: {
          "produtos": products,
          "banca_id": storeId,
          "endereco_id": enderecoId,
          "forma_pagamento_id": formaPagamento,
          "tipo_entrega": tipoEntrega,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['error'] != null) {
          throw Exception(response.data['error']);
        }

        // Valida se os dados do pedido existem

        print('Resposta da API: ${response.data}');

        // Cria o modelo de pedido
        final pedido = PedidoModel.fromJson(response.data);

        // Validação final
        if (pedido.id == null) {
          throw Exception('ID do pedido retornado é nulo.');
        }

        return pedido;
      } else {
        throw Exception(
          'Falha ao realizar a compra. Código: ${response.statusCode}.',
        );
      }
    } on DioError catch (dioError) {
      if (dioError.response?.statusCode == 400) {
        final errorMessage =
            dioError.response?.data['error'] ?? 'Erro desconhecido';
        throw Exception(errorMessage);
      } else {
        throw Exception('Erro ao realizar a compra: ${dioError.message}');
      }
    }
  }
}
