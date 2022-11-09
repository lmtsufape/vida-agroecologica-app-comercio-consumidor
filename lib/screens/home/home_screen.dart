import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/screens/home/home_screen_controller.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/components/BottomNavigation.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assets/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => HomeScreenController(),
      builder: (context, child) => Consumer<HomeScreenController>(
        builder: ((context, controller, child) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Ecommerce Bonito',
                  style: TextStyle(color: kOnSurfaceColor),
                ),
                centerTitle: true,
                backgroundColor: kDetailColor,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: kOnSurfaceColor,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Screens.profile);
                    },
                  ), //IconButton
                ],
                //IconButton
              ),
              bottomNavigationBar:
                  BottomNavigation(selectedIndex: selectedIndex),
              body: Container(
                color: kOnSurfaceColor,
                width: size.width,
                padding: const EdgeInsets.all(20),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
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
                              color: kDetailColor,
                              size: 25,
                            ),
                          )),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
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
                            onTap: () {
                              Navigator.pushNamed(context, Screens.menu);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: kOnSurfaceColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            kTextButtonColor.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Center(
                                            child: Image.asset(
                                          Assets.vegetais,
                                          fit: BoxFit.cover,
                                          height: 48,
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
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Screens.menu);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: kOnSurfaceColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            kTextButtonColor.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Center(
                                            child: Image.asset(
                                          Assets.frutas,
                                          fit: BoxFit.cover,
                                          height: 48,
                                        )),
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          child: const Text(
                                            'Frutas',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Screens.menu);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: kOnSurfaceColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            kTextButtonColor.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Center(
                                            child: Image.asset(
                                          Assets.folhosos,
                                          fit: BoxFit.cover,
                                          height: 48,
                                        )),
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          child: const Text(
                                            'Folhosos',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Screens.menu);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: kOnSurfaceColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            kTextButtonColor.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Center(
                                            child: Image.asset(
                                          Assets.carnes,
                                          fit: BoxFit.cover,
                                          height: 48,
                                        )),
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          child: const Text(
                                            'Carnes',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Screens.menu);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: kOnSurfaceColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            kTextButtonColor.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Row(
                                          children: [
                                            Center(
                                                child: Image.asset(
                                              Assets.ovos,
                                              fit: BoxFit.cover,
                                              height: 30,
                                            )),
                                            Image.asset(
                                              Assets.leite,
                                              fit: BoxFit.cover,
                                              height: 50,
                                            )
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
                                ),
                              ],
                            )),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.large),
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
                      child: Container(
                        width: 440,
                        height: 125,
                        decoration: BoxDecoration(
                          color: kOnSurfaceColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: kTextButtonColor.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Wrap(
                            children: [
                              Row(
                                children: [
                                  const HorizontalSpacerBox(
                                      size: SpacerSize.large),
                                  Container(
                                    transformAlignment: Alignment.center,
                                    alignment: Alignment.center,
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            'João Frutas',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.favorite,
                                                color: kButtom,
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Frutas - Legumes - Tempeiros',
                                            style: TextStyle(fontSize: 15),
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Contato: (11) 99999-9999',
                                          ),
                                          IconButton(
                                            onPressed: null,
                                            icon: Icon(
                                              Icons.whatsapp,
                                              color: kButtom,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Screens.menuSeller);
                      },
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    InkWell(
                      child: Container(
                        width: 440,
                        height: 125,
                        decoration: BoxDecoration(
                          color: kOnSurfaceColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: kTextButtonColor.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Wrap(
                            children: [
                              Row(
                                children: [
                                  const HorizontalSpacerBox(
                                      size: SpacerSize.large),
                                  Container(
                                    transformAlignment: Alignment.center,
                                    alignment: Alignment.center,
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            'Leandro Carnes',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.favorite,
                                                color: kButtom,
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Frutas - Legumes - Tempeiros',
                                            style: TextStyle(fontSize: 15),
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Contato: (11) 99999-9999',
                                          ),
                                          IconButton(
                                            onPressed: null,
                                            icon: Icon(
                                              Icons.whatsapp,
                                              color: kButtom,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Screens.menuSeller);
                      },
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
