import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:flutter/material.dart';

class BottomNavigationController extends ChangeNotifier {
  
  mudarAba(index, context, paginaSelecionada) {
    if (paginaSelecionada != index) {
      paginaSelecionada = index;
      notifyListeners();
      if (paginaSelecionada == 0) {
        Navigator.pushNamed(context, Screens.home);
      } else if (paginaSelecionada == 1) {
        Navigator.pushNamed(context, Screens.cart);
      } else if (paginaSelecionada == 2) {
        Navigator.pushNamed(context, Screens.purchases);
      } else if (paginaSelecionada == 3) {
        Navigator.pushNamed(context, Screens.profile);
        
      }
    }
  }
}
