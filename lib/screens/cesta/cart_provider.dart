// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/core/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _listCart = [];

  double total = 0.00;
  int itens = 0;

  List<CartModel> get listCart => _listCart;

  CartModel retriveCardItem(int index) {
    return listCart[index];
  }

  void addCart(CartModel cartModel) {
    bool isDuplicated = false;
    for (int i = 0; i < listCart.length; i++) {
      if (cartModel.productId == listCart[i].productId) {
        listCart[i].amount += 1;
        isDuplicated = true;
        total += double.tryParse(listCart[i].price!)!;
        itens += 1;
      }
    }
    if (isDuplicated == false) {
      listCart.add(cartModel);
      total += double.tryParse(cartModel.price!)!;
      itens += 1;
    }
    notifyListeners();
  }

  void removeCart(CartModel cartModel) {
    listCart.remove(cartModel);
    total = total - double.tryParse(cartModel.price!)! * cartModel.amount;
    itens = itens - cartModel.amount;
    notifyListeners();
  }
}
