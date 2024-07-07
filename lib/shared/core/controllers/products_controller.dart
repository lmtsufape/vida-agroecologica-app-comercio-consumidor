// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/core/models/cart_model.dart';
import 'package:ecommerceassim/shared/core/models/produto_model.dart';
import 'package:ecommerceassim/shared/core/models/table_products_model.dart';
import 'package:ecommerceassim/shared/core/repositories/banca_repository.dart';
import 'package:ecommerceassim/shared/core/repositories/produto_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsController extends GetxController {
  List<CartModel> listCart = [];
  List<ProdutoModel> produtos1 = [];
  List<TableProductsModel> listTableProducts = [];
  ProdutoModel? produto;

  List<ProdutoModel> _produtos = [];
  List<ProdutoModel> filteredProdutos = [];
  final _hasError = false;

  RxBool isLoading = false.obs;
  List<ProdutoModel?> cartProduct = [];
  Dio dio;

  ProductsController(this.dio);

  final ProdutoRepository produtoRepository = ProdutoRepository(Dio());
  final BancaRepository bancaRepository = BancaRepository();

  CartModel createCart(BuildContext context, int amount, ProdutoModel produto) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
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
      filteredProdutos = _produtos;
      update();
    } catch (error) {
      print('Erro ao carregar os produtos: $error');
    } finally {
      isLoading(false);
    }
  }

  void searchProdutosLocalmente(String query) {
    if (query.isEmpty) {
      filteredProdutos = _produtos;
    } else {
      filteredProdutos = _produtos
          .where((produto) =>
              produto.titulo.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  void filterProdutosByCategoryIndex(int categoryIndex) {
    const List<String> categories = [
      "Mel",
      "Legumes",
      "Polpa de Frutas",
      "Grãos",
      "Verduras",
      "Raízes",
      "Frutas",
      "Produtos Beneficiados",
      "Plantas/Ervas Medicinais"
    ];

    if (categoryIndex == -1) {
      filteredProdutos = _produtos;
    } else if (categoryIndex >= 0 && categoryIndex < categories.length) {
      String categoryName = categories[categoryIndex];
      filteredProdutos = _produtos
          .where((produto) =>
              produto.categoria.toLowerCase() == categoryName.toLowerCase())
          .toList();
    } else {
      filteredProdutos = _produtos;
    }
    update();
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

  List<ProdutoModel> get produtos => filteredProdutos;

  bool get hasError => _hasError;
}
