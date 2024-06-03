import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:flutter/material.dart';

class BottomNavigationController extends ChangeNotifier {
  void mudarAba(int index, BuildContext context) {
    if (index != 0) {
      Navigator.pushReplacementNamed(context, _getScreenName(index));
    } else {
      Navigator.pushNamed(context, _getScreenName(index));
    }
  }

  String _getScreenName(int index) {
    switch (index) {
      case 0:
        return Screens.home;
      case 1:
        return Screens.cart;
      case 2:
        return Screens.purchases;
      case 3:
        return Screens.profile;
      default:
        return Screens.home; // Caso padrão, retorna a tela inicial
    }
  }
}
