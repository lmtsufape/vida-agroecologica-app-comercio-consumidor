import 'package:flutter/material.dart';
import '../../screens/screens_index.dart';

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
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Vendedores',
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.storefront,
              color: Colors.white,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Pedidos',
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.list_alt,
              color: Colors.white,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cesta',
            icon: Icon(
              Icons.shopping_basket_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.orange,
        onTap: (index) {
          selectedIndex = index;
          if (selectedIndex == 0) {
            Navigator.pushNamed(context, Screens.home);
          } else if (selectedIndex == 1) {
            Navigator.pushNamed(context, Screens.favorite);
          } else if (selectedIndex == 2) {
            Navigator.pushNamed(context, Screens.purchases);
          } else if (selectedIndex == 3) {
            Navigator.pushNamed(context, Screens.home);
          }
        });
  }
}
