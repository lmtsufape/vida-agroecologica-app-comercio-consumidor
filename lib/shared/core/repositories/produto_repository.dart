import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/models/produto_model.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';

class ProdutoRepository {
  late String userToken;
  final Dio _dio;

  ProdutoRepository(this._dio);

  Future<List<ProdutoModel>> getProdutos(int bancaId) async {
    UserStorage userStorage = UserStorage();
    userToken = await userStorage.getUserToken();

    try {
      var response = await _dio.get('$kBaseURL/bancas/$bancaId/produtos',
          options: Options(
            headers: {"Authorization": "Bearer $userToken"},
          ));
      if (response.statusCode == 200) {
        List<dynamic> produtosJson = response.data['produtos'] ?? [];
        if (produtosJson.isEmpty) {
          throw Exception('Nenhum produto cadastrado para esta banca.');
        }
        // Filtro para apenas produtos disponiveis
        final List<ProdutoModel> produtosDisponiveis = produtosJson
            .where((produtoJson) => produtoJson['disponivel'] == true)
            .map((produtoJson) => ProdutoModel.fromJson(produtoJson))
            .toList();

        if (produtosDisponiveis.isEmpty) {
          throw Exception('Nenhum produto disponível para esta banca.');
        }

        return produtosDisponiveis;
      } else {
        throw Exception('Não foi possível carregar os produtos da banca.');
      }
    } catch (error) {
      throw Exception('Erro ao fazer a requisição: $error');
    }
  }
}
