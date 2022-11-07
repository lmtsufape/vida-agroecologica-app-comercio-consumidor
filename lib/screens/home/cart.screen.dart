import 'package:ecommercebonito/assets/index.dart';
import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/screens/home/home_screen_controller.dart';
import 'package:ecommercebonito/shared/components/BottomNavigation.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:ecommercebonito/shared/constants/app_number_constants.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/buttons/primary_button.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../screens_index.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late int melancia = 0;
    late int limao = 0;
    late int _selectedIndex = 0;
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
                    BottomNavigation(selectedIndex: _selectedIndex),
                body: SingleChildScrollView(
                  child: Container(
                    color: kOnSurfaceColor,
                    width: size.width,
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(children: [
                      Row(
                        children: const [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          HorizontalSpacerBox(size: SpacerSize.small),
                          Text(
                            'RS 64,50',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.medium),
                      PrimaryButton(
                        text: 'Fechar Pedido (2 itens)',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Screens.FinalizePurchase);
                        },
                        color: Colors.green,
                      ),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      InkWell(
                        child: Container(
                          width: 420,
                          height: 235,
                          decoration: BoxDecoration(
                            color: kOnSurfaceColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: kTextButtonColor.withOpacity(0.5),
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
                                      width: 160.0,
                                      height: 150.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(Assets.melancia),
                                        ),
                                      ),
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const VerticalSpacerBox(
                                            size: SpacerSize.large),
                                        Row(
                                          children: const [
                                            Text(
                                              'Melancia',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.medium),
                                        Row(
                                          children: const [
                                            Text(
                                              'RS 5,50',
                                              style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.end,
                                            ),
                                            HorizontalSpacerBox(
                                                size: SpacerSize.tiny),
                                            Text(
                                              'Kg',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.small),
                                        Row(
                                          children: const [
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
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.whatsapp,
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
                                const HorizontalSpacerBox(
                                    size: SpacerSize.huge),
                                const Text(
                                  'Quantidade:',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.end,
                                ),
                                Row(
                                  children: [
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        if (melancia > 0) {
                                          melancia--;
                                        }
                                      },
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    Text(
                                      melancia.toString(),
                                      style: const TextStyle(fontSize: 15),
                                      textAlign: TextAlign.end,
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        melancia++;
                                      },
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.large),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                kOnSurfaceColor),
                                      ),
                                      child: const Text(
                                        'Excluir',
                                        style: TextStyle(
                                            fontSize: 15, color: kTextButtonColor),
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalSpacerBox(size: SpacerSize.tiny),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {},
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      InkWell(
                        child: Container(
                          width: 420,
                          height: 235,
                          decoration: BoxDecoration(
                            color: kOnSurfaceColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: kTextButtonColor.withOpacity(0.5),
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
                                      width: 160.0,
                                      height: 150.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(Assets.limao),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const VerticalSpacerBox(
                                            size: SpacerSize.large),
                                        Row(
                                          children: const [
                                            Text(
                                              'Limão',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.medium),
                                        Row(
                                          children: const [
                                            Text(
                                              'RS 3,50',
                                              style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.end,
                                            ),
                                            HorizontalSpacerBox(
                                                size: SpacerSize.tiny),
                                            Text(
                                              'Kg',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.small),
                                        Row(
                                          children: const [
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'João Frutas',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green),
                                            ),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.whatsapp,
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
                                const HorizontalSpacerBox(
                                    size: SpacerSize.huge),
                                const Text(
                                  'Quantidade:',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.end,
                                ),
                                Row(
                                  children: [
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        if (limao > 0) {
                                          limao--;
                                        }
                                      },
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    Text(
                                      limao.toString(),
                                      style: const TextStyle(fontSize: 15),
                                      textAlign: TextAlign.end,
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        limao++;
                                      },
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.large),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                kOnSurfaceColor),
                                      ),
                                      child: const Text(
                                        'Excluir',
                                        style: TextStyle(
                                            fontSize: 15, color: kTextButtonColor),
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalSpacerBox(size: SpacerSize.tiny),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {},
                      ),
                    ]),
                  ),
                ),
              ))),
    );
  }
}
