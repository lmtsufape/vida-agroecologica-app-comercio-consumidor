// ignore_for_file: avoid_print, camel_case_types, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';

class purchaseRepository {
  Dio dio = Dio();

  Future<bool> purchase(List<List> products, int storeId, String userToken,
      int enderecoId, String tipoEntrega, int formaPagamento) async {
    print(products);
    print(storeId);
    print(userToken);
    print(enderecoId);
    print(formaPagamento);
    print(tipoEntrega);
    try {
      final response = await dio.post(
        '$kBaseURL/transacoes',
        options: Options(headers: {"Authorization": "Bearer $userToken"}),
        data: {
          "produtos": products,
          "banca_id": storeId,
          "endereco_id": enderecoId,
          "forma_pagamento_id": formaPagamento,
          "tipo_entrega": tipoEntrega
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['error'] != null) {
          throw Exception(response.data['error']);
        }
        return true;
      } else {
        throw Exception(
            'Failed to purchase with status code: ${response.statusCode}.');
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
