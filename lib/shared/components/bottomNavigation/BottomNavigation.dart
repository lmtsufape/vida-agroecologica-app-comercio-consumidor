// ignore_for_file: file_names

import 'package:ecommerceassim/shared/components/bottomNavigation/bottom_navigator_controller.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatelessWidget {
  int? paginaSelecionada = 0;
  BottomNavigation({super.key, this.paginaSelecionada});

  @override
  Widget build(BuildContext context) {
    var bottomNavigatorController =
        Provider.of<BottomNavigationController>(context);
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Início',
            backgroundColor: kOnSurfaceColor,
            icon: Icon(
              Icons.home_filled,
              color: kDetailColor,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cesta',
            icon: Icon(
              Icons.shopping_basket_rounded,
              color: kDetailColor,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Pedidos',
            backgroundColor: kOnSurfaceColor,
            icon: Icon(
              Icons.article_rounded,
              color: kDetailColor,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            backgroundColor: kOnSurfaceColor,
            icon: Icon(
              Icons.person,
              color: kDetailColor,
              size: 40,
            ),
          ),
        ],
        currentIndex: paginaSelecionada ?? 0,
        unselectedItemColor: kTextNavColor,
        selectedItemColor: kDetailColor,
        backgroundColor: kOnSurfaceColor,
        onTap: (index) {
          bottomNavigatorController.mudarAba(index, context, paginaSelecionada);
        });
  }
}
