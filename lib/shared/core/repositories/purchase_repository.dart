// ignore_for_file: avoid_print, camel_case_types

import 'package:dio/dio.dart';
import 'package:vidaagroconsumidor/shared/constants/app_text_constants.dart';
import '../models/pedidos_model.dart';

class purchaseRepository {
  Dio dio = Dio();

  Future<PedidoModel> purchase(
    List<List> products,
    int storeId,
    String userToken,
    int enderecoId,
    String tipoEntrega,
    int formaPagamento,
  ) async {
    try {
      // Log dos dados enviados
      print("Dados do pedido:");
      print("Produtos: $products");
      print("Banca ID: $storeId");
      print("Endereço ID: $enderecoId");
      print("Forma Pagamento: $formaPagamento");
      print("Tipo Entrega: $tipoEntrega");

      final response = await dio.post(
        '$kBaseURL/transacoes',
        options: Options(
          headers: {
            "Authorization": "Bearer $userToken",
            "Content-Type": "application/json",
          },
        ),
        data: {
          "produtos": products,
          "banca_id": storeId,
          "endereco_id": enderecoId,
          "forma_pagamento_id": formaPagamento,
          "tipo_entrega": tipoEntrega,
        },
      );

      print('Resposta da API: ${response.data}');

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(
          'Falha ao realizar a compra. Código: ${response.statusCode}',
        );
      }

      // Verifica se há erro na resposta
      if (response.data['error'] != null) {
        throw Exception(response.data['error']);
      }

      // Verifica se os dados necessários existem
      if (response.data == null) {
        throw Exception('Resposta da API está vazia');
      }

      try {
        final pedido = PedidoModel.fromJson(response.data);
        
        // Validação adicional após criar o modelo
        if (pedido.id == null) {
          throw Exception('ID do pedido não foi gerado corretamente');
        }

        return pedido;
      } catch (parseError) {
        print('Erro ao converter resposta para PedidoModel: $parseError');
        print('Dados recebidos: ${response.data}');
        throw Exception('Erro ao processar resposta do servidor');
      }

    } on DioError catch (dioError) {
      print('DioError: ${dioError.message}');
      print('DioError Response: ${dioError.response?.data}');
      
      if (dioError.response?.statusCode == 400) {
        final errorMessage = dioError.response?.data['error'] ?? 'Erro na requisição';
        throw Exception(errorMessage);
      }
      throw Exception('Erro na comunicação com o servidor');
    } catch (e) {
      print('Erro não esperado: $e');
      throw Exception('Erro ao processar a compra');
    }
  }
}