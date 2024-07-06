import 'package:ecommerceassim/assets/index.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:ecommerceassim/shared/core/controllers/home_screen_controller.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/utils/horizontal_spacer_box.dart';

class MenuSellerScreen extends StatelessWidget {
  const MenuSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => HomeScreenController(),
      builder: (context, child) => Consumer<HomeScreenController>(
        builder: ((context, controller, child) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Ecommerce ASSIM',
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: kDetailColor,
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
              bottomNavigationBar: BottomNavigation(),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      InkWell(
                        child: Container(
                          width: 440,
                          height: 90,
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
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        VerticalSpacerBox(
                                            size: SpacerSize.medium),
                                        Row(
                                          children: [
                                            Text(
                                              'João Frutas',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Contato: (11) 99999-9999',
                                            ),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.phone,
                                                color: Colors.green,
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
                      const VerticalSpacerBox(size: SpacerSize.medium),
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
                                color: kButtom,
                                size: 25,
                              ),
                            )),
                      ),
                      const VerticalSpacerBox(size: SpacerSize.medium),
                      SingleChildScrollView(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 210,
                                  height: 300,
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
                                              width: 160.0,
                                              height: 180.0,
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
                                        const Row(
                                          children: [
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
                                        const Row(
                                          children: [
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
                                                size: 35,
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
                                  height: 300,
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
                                              width: 160.0,
                                              height: 180.0,
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
                                        const Row(
                                          children: [
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
                                        const Row(
                                          children: [
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
                                                size: 35,
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
                                  height: 300,
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
                                              width: 160.0,
                                              height: 180.0,
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
                                        const Row(
                                          children: [
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
                                        const Row(
                                          children: [
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
                                                size: 35,
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
                                  height: 300,
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
                                              width: 160.0,
                                              height: 180.0,
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
                                        const Row(
                                          children: [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Limão',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.tiny),
                                        const Row(
                                          children: [
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
                                                size: 35,
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
