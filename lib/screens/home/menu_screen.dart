import 'package:ecommercebonito/assets/index.dart';
import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ecommercebonito/screens/home/home_screen_controller.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

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
              body: SingleChildScrollView(
                child: Container(
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
                                          offset: const Offset(0,
                                              5), // changes position of shadow
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
                                          offset: const Offset(0,
                                              5), // changes position of shadow
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
                                          offset: const Offset(0,
                                              5), // changes position of shadow
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
                                          offset: const Offset(0,
                                              5), // changes position of shadow
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
                                          offset: const Offset(0,
                                              5), // changes position of shadow
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
                                                allowDrawingOutsideViewBox:
                                                    true,
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
                      SingleChildScrollView(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 210,
                                  height: 320,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
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
                                              width: 161.0,
                                              height: 190.0,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      AssetImage(Assets.banana),
                                                ),
                                              ),
                                            ),
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'RS 0,25',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'Unidade',
                                        ),
                                        Row(
                                          children: const [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Banana',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.tiny),
                                        Row(
                                          children: const [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Maria',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.add_box,
                                                color: Colors.green,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () async {},
                              ),
                              const HorizontalSpacerBox(size: SpacerSize.tiny),
                              InkWell(
                                child: Container(
                                  width: 210,
                                  height: 320,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
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
                                              width: 150.0,
                                              height: 190.0,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      AssetImage(Assets.maca),
                                                ),
                                              ),
                                            ),
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'RS 1,18',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'Unidade',
                                        ),
                                        Row(
                                          children: const [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Maça',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.tiny),
                                        Row(
                                          children: const [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'João',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.add_box,
                                                color: Colors.green,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () async {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      SingleChildScrollView(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 210,
                                  height: 320,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
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
                                              width: 161.0,
                                              height: 190.0,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      Assets.melancia),
                                                ),
                                              ),
                                            ),
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'RS 3,18',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'Unidade',
                                        ),
                                        Row(
                                          children: const [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Melancia',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.tiny),
                                        Row(
                                          children: const [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Maria',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.add_box,
                                                color: Colors.green,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () async {},
                              ),
                              const HorizontalSpacerBox(size: SpacerSize.tiny),
                              InkWell(
                                child: Container(
                                  width: 210,
                                  height: 320,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
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
                                              width: 150.0,
                                              height: 190.0,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      AssetImage(Assets.limao),
                                                ),
                                              ),
                                            ),
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'RS 0,50',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'Unidade',
                                        ),
                                        Row(
                                          children: const [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Maça',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.tiny),
                                        Row(
                                          children: const [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'João',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.add_box,
                                                color: Colors.green,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () async {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
