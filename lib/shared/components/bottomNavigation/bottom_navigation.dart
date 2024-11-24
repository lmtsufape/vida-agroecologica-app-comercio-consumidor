import 'package:vidaagroconsumidor/screens/cesta/cart_provider.dart';

import 'package:vidaagroconsumidor/shared/components/bottomNavigation/bottom_navigator_controller.dart';
import 'package:vidaagroconsumidor/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges; // Correção do alias badges

// ignore: must_be_immutable
class BottomNavigation extends StatelessWidget {
  int? paginaSelecionada = 0;
  BottomNavigation({super.key, this.paginaSelecionada});

  @override
  Widget build(BuildContext context) {

    final numeroTotalPedido = Provider.of<CartProvider>(context);

    var bottomNavigatorController =
        Provider.of<BottomNavigationController>(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
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
          icon: badges.Badge( 
          badgeStyle: const badges.BadgeStyle(badgeColor: kDetailColor),
            badgeContent: Text(
              '${numeroTotalPedido.itens}',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            position: badges.BadgePosition.topEnd(top: -8, end: -8),
            child: const Icon(
              Icons.shopping_basket_rounded,
              color: kDetailColor,
              size: 40,
            ),
          ),
        ),

        const BottomNavigationBarItem(
          label: 'Pedidos',
          backgroundColor: kOnSurfaceColor,
          icon: Icon(
            Icons.article_rounded,
            color: kDetailColor,
            size: 40,
          ),
        ),
        const BottomNavigationBarItem(
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
      },
    );
  }
}
