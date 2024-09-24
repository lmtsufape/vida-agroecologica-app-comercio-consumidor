// ignore_for_file: avoid_print, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:vidaagroconsumidor/shared/core/models/banca_model.dart';
import 'package:vidaagroconsumidor/shared/core/models/cart_model.dart';
import 'package:vidaagroconsumidor/shared/core/repositories/banca_repository.dart';
import 'package:vidaagroconsumidor/shared/core/repositories/purchase_repository.dart';
import 'package:vidaagroconsumidor/shared/core/user_storage.dart';
import 'package:get/get.dart';

class PurchaseController extends GetxController {
  int idStore = 0;
  List<BancaModel> bancas = [];
  BancaModel? bancaModel;
  List<CartModel>? listCartModel;
  int? enderecoId;
  int? formaPagamento;
  bool? isDelivery;
  UserStorage userStorage = UserStorage();
  String userName = '';
  String userToken = '';
  String tipoEntrega = '';
  final BancaRepository _bancaRepository = BancaRepository();
  final purchaseRepository _purchaseRepository = purchaseRepository();

  PurchaseController({required this.listCartModel});

  Future<void> loadBancas() async {
    try {
      bancas = await _bancaRepository.getBancas();
      print(bancas);
      update();
    } catch (error) {
      print('Erro ao carregar a banca: $error');
    }
  }

  Future<bool> purchase(
      int enderecoId, String tipoEntrega, int formaPagamento) async {
    List<List> listCartModelSplited = [];
    for (var cart in listCartModel!) {
      for (int idBanca = 0; idBanca < bancas.length; idBanca++) {
        if (bancas[idBanca].id == cart.storeId!) {
          idStore = idBanca;
        }
      }
      bancaModel = bancas[idStore];
      print(bancaModel!.nome);
      List listItem = [];
      listItem.add(cart.productId);
      listItem.add(cart.amount);
      listCartModelSplited.add(listItem);
    }
    try {
      final response = await _purchaseRepository.purchase(listCartModelSplited,
          bancaModel!.id, userToken, enderecoId, tipoEntrega, formaPagamento);
      return response;
    } on DioError catch (dioError) {
      if (dioError.response?.statusCode == 400) {
        final errorMessage =
            dioError.response?.data['error'] ?? 'Erro desconhecido';
        throw Exception(errorMessage);
      } else {
        throw Exception('Erro ao realizar a compra: ${dioError.message}');
      }
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  double get totalValue => listCartModel?.isNotEmpty == true
      ? listCartModel!.fold(
          0, (total, cart) => total + cart.amount * double.parse(cart.price!))
      : 0;

  void removeZeroQuantityItems() {
    listCartModel?.removeWhere((item) => item.amount <= 0);
    update();
  }

  void updateCartItemQuantity(int productId, int quantity) {
    final cartItem =
        listCartModel?.firstWhereOrNull((item) => item.productId == productId);
    if (cartItem != null) {
      cartItem.amount = quantity;
      if (cartItem.amount <= 0) {
        listCartModel?.remove(cartItem);
      }
      update();
    }
  }

  @override
  void onInit() async {
    await loadBancas();
    userName = await userStorage.getUserName();
    userToken = await userStorage.getUserToken();
    removeZeroQuantityItems(); // Ensure no zero quantity items at the start
    update();
    super.onInit();
  }
}
