import 'dart:ui';

import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
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
                title: const Text(
                  'Ecommerce Bonito',
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: Colors.orange,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ), //IconButton
                ],
                //IconButton
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    label: 'Início',
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Vendedores',
                    icon: Icon(
                      Icons.storefront,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Pedidos',
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
                backgroundColor: Colors.orange,
              ),
              body: Container(
                width: size.width,
                padding: const EdgeInsets.all(20),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            hintText: 'Buscar',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.orange,
                              size: 25,
                            ),
                          )),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Row(
                      children: const [
                        Text(
                          'Categorias',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () async {},
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Wrap(
                                    children: [
                                      const Center(
                                        child: Icon(Icons.timeline,
                                            size: 50, color: Colors.orange),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: const Text(
                                          'Vegetais',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () async {},
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Wrap(
                                    children: [
                                      const Center(
                                        child: Icon(Icons.timeline,
                                            size: 50, color: Colors.orange),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: const Text(
                                          'Frutas',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () async {},
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Wrap(
                                    children: [
                                      const Center(
                                        child: Icon(Icons.timeline,
                                            size: 50, color: Colors.orange),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: const Text(
                                          'Folhosos',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () async {},
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Wrap(
                                    children: [
                                      const Center(
                                        child: Icon(Icons.timeline,
                                            size: 50, color: Colors.orange),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: const Text(
                                          'Carnes',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () async {},
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Wrap(
                                    children: [
                                      const Center(
                                        child: Icon(Icons.timeline,
                                            size: 50, color: Colors.orange),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: const Text(
                                          'Leite e Ovos',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: const [
                        Text(
                          'Vendedores',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
