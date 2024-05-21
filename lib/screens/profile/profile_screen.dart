import 'package:ecommercebonito/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:ecommercebonito/components/appBar/custom_app_bar.dart';
import 'package:ecommercebonito/components/forms/custom_ink.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:ecommercebonito/shared/core/user_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserStorage userStorage = UserStorage();

    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: BottomNavigation(
        paginaSelecionada: 3,
      ),
      body: Material(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: kDetailColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 16),
                    FutureBuilder<String>(
                      future: userStorage.getUserName(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Carregando...',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18));
                        } else if (snapshot.hasError ||
                            !snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Text('Convidado',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500));
                        } else {
                          String nameToShow =
                              snapshot.data!.split(' ').take(3).join(' ');
                          return Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(nameToShow,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Screens.perfilEditar);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CustomInkWell(
                    icon: Icons.shopping_bag,
                    text: 'Pedidos',
                    onTap: () =>
                        Navigator.pushNamed(context, Screens.purchases),
                  ),
                  CustomInkWell(
                    icon: Icons.location_on,
                    text: 'Endereços',
                    onTap: () =>
                        Navigator.pushNamed(context, Screens.selectAdress),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
