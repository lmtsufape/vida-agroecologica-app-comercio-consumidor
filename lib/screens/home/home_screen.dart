import 'dart:ui';

import 'package:ecommercebonito/assets/index.dart';
import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
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
                    onPressed: () {
                      Navigator.pushNamed(context, Screens.profile);
                    },
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
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.large),
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
                                      Center(
                                          child: SvgPicture.asset(
                                        Assets.vegetais,
                                        color: Colors.orange,
                                        height: 40,
                                        width: 40,
                                        allowDrawingOutsideViewBox: true,
                                      )),
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
                                      Center(
                                        child: SvgPicture.asset(
                                          Assets.frutas,
                                          color: Colors.orange,
                                          height: 40,
                                          width: 40,
                                          allowDrawingOutsideViewBox: true,
                                        ),
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
                                      Center(
                                        child: SvgPicture.asset(
                                          Assets.folhosos,
                                          color: Colors.orange,
                                          height: 40,
                                          width: 40,
                                          allowDrawingOutsideViewBox: true,
                                        ),
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
                                      Center(
                                        child: SvgPicture.asset(
                                          Assets.carnes,
                                          color: Colors.orange,
                                          height: 40,
                                          width: 40,
                                          allowDrawingOutsideViewBox: true,
                                        ),
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
                                      Row(
                                        children: [
                                          Center(
                                            child: SvgPicture.asset(
                                              Assets.ovos,
                                              color: Colors.orange,
                                              height: 30,
                                              width: 30,
                                              allowDrawingOutsideViewBox: true,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            Assets.leite,
                                            color: Colors.orange,
                                            height: 40,
                                            width: 40,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ],
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
                    Row(
                      children: const [
                        Text(
                          'Vendedores',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 440,
                            height: 125,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: Wrap(
                                children: [
                                  Row(
                                    children: [
                                      const HorizontalSpacerBox(
                                          size: SpacerSize.large),
                                      Container(
                                        width: 65.0,
                                        height: 65.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://gentv.com.br/img/content/266-1"),
                                          ),
                                        ),
                                      ),
                                      const HorizontalSpacerBox(
                                          size: SpacerSize.large),
                                      const Text(
                                        'João Frutas',
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.end,
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: Colors.green,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      HorizontalSpacerBox(
                                          size: SpacerSize.large),
                                      Text('Frutas - Legumes - Tempeiros'),
                                    ],
                                  ),
                                  const VerticalSpacerBox(
                                      size: SpacerSize.small),
                                  Row(
                                    children: const [
                                      HorizontalSpacerBox(
                                          size: SpacerSize.large),
                                      Text(
                                        'Contato: (11) 99999-9999',
                                      ),
                                      HorizontalSpacerBox(
                                          size: SpacerSize.tiny),
                                      Icon(
                                        Icons.whatsapp,
                                        color: Colors.green,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {},
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 440,
                            height: 125,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: Wrap(
                                children: [
                                  Row(
                                    children: [
                                      const HorizontalSpacerBox(
                                          size: SpacerSize.large),
                                      Container(
                                        width: 65.0,
                                        height: 65.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://expomeat.com.br/img/site/1666/m/5413240.jpg"),
                                          ),
                                        ),
                                      ),
                                      const HorizontalSpacerBox(
                                          size: SpacerSize.large),
                                      const Text(
                                        'Leandro Carnes',
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.end,
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: Colors.green,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      HorizontalSpacerBox(
                                          size: SpacerSize.large),
                                      Text('Frutas - Legumes - Tempeiros'),
                                    ],
                                  ),
                                  const VerticalSpacerBox(
                                      size: SpacerSize.small),
                                  Row(
                                    children: const [
                                      HorizontalSpacerBox(
                                          size: SpacerSize.large),
                                      Text(
                                        'Contato: (11) 99999-9999',
                                      ),
                                      HorizontalSpacerBox(
                                          size: SpacerSize.tiny),
                                      Icon(
                                        Icons.whatsapp,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {},
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
