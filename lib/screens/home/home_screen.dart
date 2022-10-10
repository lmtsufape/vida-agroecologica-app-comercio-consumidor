import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommercebonito/components/buttons/custom_text_button.dart';
import 'package:ecommercebonito/screens/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => HomeScreenController(),
      builder: (context, child) => Consumer<HomeScreenController>(
        builder: ((context, controller, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Ecoomerce Bonito'),
              ),
              body: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextButton(
                        title: 'Pegar permissão da câmera',
                        onPressed: () {
                          controller.requestUserGalleryPermission();
                        })
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
