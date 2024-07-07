// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';
import 'package:ecommerceassim/shared/core/models/cart_model.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/core/models/table_products_model.dart';
import '../../shared/core/user_storage.dart';
import 'card_cart.dart';

class CartController extends GetxController {
  UserStorage userStorage = UserStorage();
  int _counter = 0;
  int get counter => _counter;
  double total = 0.00;
  late int amount = 0;
  List<CardCart> cards = [];
  List<TableProductsModel> listTableProducts = [];

  //ProductsController productsController = ProductsController();

  List<CardCart> populateCardCart(List<CartModel> listCart) {
    List<CardCart> list = [];

    if (listCart.isNotEmpty) {
      for (int i = 0; i < listCart.length; i++) {
        print(listCart[i]);
        CardCart card = CardCart(listCart[i], CartController());
        list.add(card);
        print(list);
      }
    } else {
      log('CARD VAZIO');
      list = [];
      print(listCart);
      print(list);
      return list;
    }

    // Verifica se a lista está vazia antes de tentar acessá-la
    if (list.isNotEmpty) {
      update();
      print(listCart);
      print(list);
      return list;
    } else {
      throw RangeError('Lista vazia');
    }
  }

  void incrementCounter() {
    _counter++;
    update();
  }

  void decrementCounter() {
    _counter--;
    update();
  }

  void incrementTotal(double valor) {
    total += valor;
    update();
  }

  TableProductsModel? returnProdutoTabelado(int id) {
    if (listTableProducts != null) {
      for (int i = 0; i < listTableProducts.length; i++) {
        if (listTableProducts[i].id == id) {
          return listTableProducts[i];
        }
      }
    }
    return null;
  }

  Future<List<TableProductsModel>> loadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listaString =
        prefs.getStringList('listaProdutosTabelados') ?? [];
    return listaString
        .map((string) => TableProductsModel.fromJson(json.decode(string)))
        .toList();
  }

  @override
  void onInit() async {
    listTableProducts = await loadList();
    super.onInit();
    update();
  }
}
