// ignore_for_file: use_build_context_synchronously

import 'package:ecommerceassim/components/buttons/primary_button.dart';
import 'package:ecommerceassim/screens/signin/sign_in_screen.dart';
import 'package:ecommerceassim/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:ecommerceassim/shared/components/dialogs/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/components/forms/custom_ink.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';

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
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
              child: PrimaryButton(
                text: 'Sair da conta',
                onPressed: () {
                  confirmDialog(
                    context,
                    'Confirmação',
                    'Você tem certeza que deseja sair da conta?',
                    'Cancelar',
                    'Confirmar',
                    onConfirm: () async {
                      await userStorage.clearUserCredentials();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  );
                },
                color: kDetailColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
