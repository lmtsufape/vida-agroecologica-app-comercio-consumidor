import 'package:flutter/material.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:ecommercebonito/shared/core/user_storage.dart';
import 'package:ecommercebonito/screens/signin/sign_in_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStorage userStorage = UserStorage();

    return AppBar(
      automaticallyImplyLeading: false, // caso remova, volta a seta da app bar
      title: const Text(
/*         'APP-ASSIM',

 */
        "Ecommerce Bonito",
        style: TextStyle(
          color: kDetailColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: kDetailColor),
      backgroundColor: kOnSurfaceColor,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            color: kDetailColor,
          ),
          onPressed: () async {
            await userStorage.clearUserCredentials();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


/* Drawer buildCustomDrawer(BuildContext context) {
  UserStorage userStorage = UserStorage();

  return Drawer(
    child: Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    top: 100.0, bottom: 56.0, left: 16.0, right: 16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'APP-ASSIM',
                    style: TextStyle(
                      color: kDetailColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: kDetailColor),
                title: const Text(
                  'Configurações',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.person, color: kDetailColor),
                title: const Text(
                  'Perfil',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Screens.profile);
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ListTile(
            leading: const Icon(Icons.exit_to_app, color: kErrorColor),
            title: const Text(
              'Deslogar',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kErrorColor,
                  fontSize: 16),
            ),
            onTap: () {
              userStorage.clearUserCredentials();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ),
      ],
    ),
  );
}
 */