// ignore: file_names
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import '../../screens/screens_index.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatelessWidget {
  late int selectedIndex;
  BottomNavigation({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Início',
            backgroundColor: kOnSurfaceColor,
            icon: Icon(
              Icons.home,
              color: kOnSurfaceColor,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Vendedores',
            backgroundColor: kOnSurfaceColor,
            icon: Icon(
              Icons.storefront,
              color: kOnSurfaceColor,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Pedidos',
            backgroundColor: kOnSurfaceColor,
            icon: Icon(
              Icons.list_alt,
              color: kOnSurfaceColor,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cesta',
            icon: Icon(
              Icons.shopping_basket_outlined,
              color: kOnSurfaceColor,
              size: 40,
            ),
          ),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: kOnSurfaceColor,
        selectedItemColor: kOnSurfaceColor,
        backgroundColor: kDetailColor,
        onTap: (index) {
          selectedIndex = index;
          if (selectedIndex == 0) {
            Navigator.pushNamed(context, Screens.home);
          } else if (selectedIndex == 1) {
            Navigator.pushNamed(context, Screens.favorite);
          } else if (selectedIndex == 2) {
            Navigator.pushNamed(context, Screens.purchases);
          } else if (selectedIndex == 3) {
            Navigator.pushNamed(context, Screens.cart);
          }
        });
  }
}
