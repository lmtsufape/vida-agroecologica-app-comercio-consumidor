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
    int _selectedIndex = 0;
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
                  currentIndex: _selectedIndex,
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.white,
                  backgroundColor: Colors.orange,
                  onTap: (index) {
                    _selectedIndex = index;
                    if (_selectedIndex == 0) {
                      Navigator.pushNamed(context, Screens.home);
                    } else if (_selectedIndex == 1) {
                      Navigator.pushNamed(context, Screens.favorite);
                    } else if (_selectedIndex == 2) {
                      Navigator.pushNamed(context, Screens.purchases);
                    } else if (_selectedIndex == 3) {
                      Navigator.pushNamed(context, Screens.home);
                    }
                  }),
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
                            onTap: () {
                              Navigator.pushNamed(context, Screens.menu);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
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
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
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
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
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
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
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
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
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
                                                allowDrawingOutsideViewBox:
                                                    true,
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
                        height: 145,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Frutas - Legumes - Tempeiros'),
                                ],
                              ),
                              const VerticalSpacerBox(size: SpacerSize.small),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Contato: (11) 99999-9999',
                                  ),
                                  HorizontalSpacerBox(size: SpacerSize.tiny),
                                  IconButton(
                                    icon: Icon(
                                      Icons.whatsapp,
                                      color: Colors.green,
                                    ),
                                    onPressed: null,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                            height: 145,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 5), // changes position of shadow
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('Frutas - Legumes - Tempeiros'),
                                    ],
                                  ),
                                  const VerticalSpacerBox(
                                      size: SpacerSize.small),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Contato: (11) 99999-9999',
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.whatsapp,
                                          color: Colors.green,
                                        ),
                                        onPressed: null,
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
