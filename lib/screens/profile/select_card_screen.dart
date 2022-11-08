import 'package:flutter/material.dart';
import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/constants/app_enums.dart';
import '../screens_index.dart';


class SelectCard extends StatefulWidget {
  const SelectCard({Key? key}) : super(key: key);

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
 @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        body: Container(
            color: kOnSurfaceColor,
            width: size.width,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(children: [
              const VerticalSpacerBox(size: SpacerSize.small),
              Row(
                children: const [
                  Text(
                    'Informações de pagamento',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                      height: 110,
                      decoration: BoxDecoration(
                        color: kOnSurfaceColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: kTextButtonColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Text(
                                'Forma de Pagamento',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const VerticalSpacerBox(
                                      size: SpacerSize.medium),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Screens.adress);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: kTextButtonColor,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              children: const [
                                HorizontalSpacerBox(size: SpacerSize.huge),
                                Text(
                                  'Mastercard ',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text('(Crédito) ',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  'com final 1447 ',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              children: const [
                                HorizontalSpacerBox(size: SpacerSize.huge),
                                Text(
                                  'Parcelas não disponíveis',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, Screens.adress);
                },
              ),
              const VerticalSpacerBox(size: SpacerSize.medium),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 440,
                      height: 75,
                      decoration: BoxDecoration(
                        color: kOnSurfaceColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: kTextButtonColor.withOpacity(0.5),
                            spreadRadius: 2,
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
                                Container(
                                  width: 35.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const Text(
                                  'Adicione um novo cartão',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: kTextButtonColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Screens.payment);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: kTextButtonColor,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, Screens.payment);
                },
              ),
            ]))));
  }
}
