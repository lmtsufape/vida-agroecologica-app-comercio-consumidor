import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:ecommerceassim/shared/core/controllers/home_screen_controller.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    //final whats = Uri.parse('https://api.whatsapp.com/send?phone=5581997128385');
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => HomeScreenController(),
      builder: (context, child) => Consumer<HomeScreenController>(
        builder: ((context, controller, child) => Scaffold(
              appBar: const CustomAppBar(),
              bottomNavigationBar: BottomNavigation(),
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
                    const Row(
                      children: [
                        Text(
                          'Favoritos',
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
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
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
                                        children: [
                                          Text(
                                            'Frutas - Legumes - Tempeiros',
                                            style: TextStyle(fontSize: 15),
                                            textAlign: TextAlign.end,
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
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
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
                                        children: [
                                          Text(
                                            'Frutas - Legumes - Tempeiros',
                                            style: TextStyle(fontSize: 15),
                                            textAlign: TextAlign.end,
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
                    const VerticalSpacerBox(size: SpacerSize.small),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
