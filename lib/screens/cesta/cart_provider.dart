import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/core/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _listCart = [];

  double total = 0.00;
  int itens = 0;

  List<CartModel> get listCart => _listCart;

  CartModel retriveCardItem(int index) {
    return listCart[index];
  }

  void addCart(CartModel cartModel, BuildContext context) {

    bool isDifferentStore = false;
    for (int i = 0; i < listCart.length; i++) {
      if (listCart[i].storeId != cartModel.storeId) {
        isDifferentStore = true;
        break;
      }
    }

    if (isDifferentStore) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return AlertDialog(
          //   title: Text("Erro"),
          //   content: Text("Não é possível adicionar produtos de bancas diferentes no mesmo carrinho."),
          //   actions: <Widget>[
          //     TextButton(
          //       child: Text("OK"),
          //       onPressed: () {
          //         Navigator.of(context).pop(); // Fecha o diálogo
          //       },
          //     ),
          //   ],
          // );
          return CupertinoAlertDialog(
            title: Text("Erro"),
            content: Text("Não é possível adicionar produtos de bancas diferentes no mesmo carrinho."),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o diálogo
                },
              ),
            ],
          );
        },
      );
      return;  // Retorna sem adicionar o produto
    }

    bool isDuplicated = false;
    for (int i = 0; i < listCart.length; i++) {
      if (cartModel.productId == listCart[i].productId) {
        listCart[i].amount += cartModel.amount;
        isDuplicated = true;
        total += double.tryParse(listCart[i].price!)! * cartModel.amount;
        itens += cartModel.amount;
      }
    }
    if (!isDuplicated) {
      listCart.add(cartModel);
      total += double.tryParse(cartModel.price!)! * cartModel.amount;
      itens += cartModel.amount;
    }
    notifyListeners();
  }

  void removeCart(CartModel cartModel) {
    listCart.remove(cartModel);
    total = total - double.tryParse(cartModel.price!)! * cartModel.amount;
    itens = itens - cartModel.amount;
    notifyListeners();
  }

  void clearCart() {
    _listCart.clear();
    total = 0.00;
    itens = 0;
    notifyListeners();
  }

  int getProductQuantity(int productId) {
    for (var cart in listCart) {
      if (cart.productId == productId) {
        return cart.amount;
      }
    }
    return 0;
  }
}
