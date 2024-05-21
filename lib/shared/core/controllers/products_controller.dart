// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommercebonito/shared/constants/app_text_constants.dart';
import 'package:ecommercebonito/shared/core/models/table_products_model.dart';
import 'package:ecommercebonito/shared/core/repositories/banca_repository.dart';
import 'package:ecommercebonito/shared/core/user_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_model.dart';
import '../models/produto_model.dart';
import '../repositories/produto_repository.dart';

class ProductsController extends GetxController {
  List<CartModel> listCart = [];
  List<ProdutoModel> produtos1 = [];
  List<TableProductsModel> listTableProducts = [];
  ProdutoModel? produto;

  List<ProdutoModel> _produtos = [];
  bool _hasError = false;

  RxBool isLoading = false.obs;
  List<ProdutoModel?> cartProduct = [];
  Dio _dio;

  ProductsController(this._dio);

  final ProdutoRepository produtoRepository = ProdutoRepository(Dio());
  final BancaRepository bancaRepository = BancaRepository(Dio());

  CartModel createCart(BuildContext context, int amount, ProdutoModel produto) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final int bancaId = arguments['id'];

    CartModel cart = CartModel(produto.id, bancaId, produto.titulo,
        produto.preco, produto.produtoTabeladoId, amount, produto.estoque);
    return cart;
  }

  Future<List<TableProductsModel>> loadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listaString =
        prefs.getStringList('listaProdutosTabelados') ?? [];
    return listaString
        .map((string) => TableProductsModel.fromJson(json.decode(string)))
        .toList();
  }

  Future<void> loadProdutos(int bancaId) async {
    try {
      isLoading(true);
      produtos1 = await produtoRepository.getProdutos(bancaId);
      _produtos = produtos1;
      update();
    } catch (error) {
      print('Erro ao carregar os produtos: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> searchProdutos(int bancaId, String query) async {
    UserStorage userStorage = UserStorage();
    String userToken = await userStorage.getUserToken();

    if (query.isEmpty) {
      await loadProdutos(bancaId);
      return;
    }

    try {
      isLoading(true);

      var options = Options(headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Cache-Control': 'no-cache',
        "Authorization": "Bearer $userToken",
      });

      var response = await _dio.get(
          '$kBaseURL/bancas/$bancaId/produtos?search=$query',
          options: options);

      if (response.statusCode == 200) {
        var json = response.data;
        if (json['produtos'].isEmpty) {
          _produtos = [];
          _hasError = true;
        } else {
          _produtos = List<ProdutoModel>.from(
              json['produtos'].map((x) => ProdutoModel.fromJson(x)));
          _hasError = false;
        }
      } else {
        _produtos = [];
        _hasError = true;
      }
    } catch (error) {
      print('Erro na busca de produtos: $error');
      _produtos = [];
      _hasError = true;
    } finally {
      isLoading(false);
      update();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    listTableProducts = await loadList();
    update();
  }

  Future<void> initializeProducts(int bancaId) async {
    await loadProdutos(bancaId);
  }

  List<ProdutoModel> get produtos => _produtos;

  bool get hasError => _hasError;
}
