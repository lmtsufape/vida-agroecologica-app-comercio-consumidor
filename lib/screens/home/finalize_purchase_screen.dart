import 'package:ecommercebonito/screens/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:provider/provider.dart';
import '../../components/buttons/primary_button.dart';
import '../../shared/components/dialogs/finish_purchase.dart';

class FinalizePurchaseScreen extends StatefulWidget {
  const FinalizePurchaseScreen({Key? key}) : super(key: key);

  @override
  State<FinalizePurchaseScreen> createState() => _FinalizePurchaseScreenState();
}

class _FinalizePurchaseScreenState extends State<FinalizePurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    String? formaEntrega;
    String? formaPag;
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
                  body: Container(
                      color: kOnSurfaceColor,
                      width: size.width,
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                          child: Column(children: [
                        const VerticalSpacerBox(size: SpacerSize.medium),
                        InkWell(
                          child: Row(
                            children: [
                              Container(
                                width: 440,
                                height: 270,
                                decoration: BoxDecoration(
                                  color: kOnSurfaceColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
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
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.5),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 35.0,
                                            height: 55.0,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const Text(
                                            'Enviado para:',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          const HorizontalSpacerBox(
                                              size: SpacerSize.medium),
                                          const Text(
                                            'Maria Eduarda',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: kTextButtonColor,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: kTextButtonColor,
                                      height: 20,
                                      thickness: 1,
                                      indent: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 6),
                                      child: Row(
                                        children: const [
                                          HorizontalSpacerBox(
                                              size: SpacerSize.large),
                                          Text(
                                            'Vendido por:',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Spacer(),
                                          Text(
                                            'João Frutas',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: kButtom),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const VerticalSpacerBox(
                                        size: SpacerSize.small),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 6),
                                      child: Row(
                                        children: const [
                                          HorizontalSpacerBox(
                                              size: SpacerSize.large),
                                          Text(
                                            'Itens:',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Spacer(),
                                          Text(
                                            'RS 55,62',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 6),
                                      child: Row(
                                        children: const [
                                          HorizontalSpacerBox(
                                              size: SpacerSize.large),
                                          Text(
                                            'Taxa de entrega:',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Spacer(),
                                          Text(
                                            'RS 7,00',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 6),
                                      child: Row(
                                        children: const [
                                          HorizontalSpacerBox(
                                              size: SpacerSize.large),
                                          Text(
                                            'Total do pedido:',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            'RS 64,50',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: kDetailColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 6),
                                      child: Row(
                                        children: [
                                          const HorizontalSpacerBox(
                                              size: SpacerSize.large),
                                          const Text(
                                            'Em 1x de RS 64,50 sem juros',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, Screens.selectCard);
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kDetailColor),
                                            ),
                                            child: const Text(
                                              'Alterar',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: kOnSurfaceColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () async {},
                        ),
                        const VerticalSpacerBox(size: SpacerSize.medium),
                        Row(children: const [
                          Text(
                            'Forma de entrega',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ]),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    overlayColor:
                                        MaterialStateProperty.all(kDetailColor),
                                    value: 'Retirada',
                                    groupValue: formaEntrega,
                                    onChanged: (value) {
                                      setState(() {
                                        formaEntrega = value.toString();
                                      });
                                    }),
                                const Text(
                                  'Retirada',
                                  style: TextStyle(
                                      fontSize: 20, color: kTextButtonColor),
                                ),
                              ],
                            ),
                            const HorizontalSpacerBox(size: SpacerSize.small),
                            Row(
                              children: [
                                Radio(
                                    overlayColor:
                                        MaterialStateProperty.all(kDetailColor),
                                    value: 'Entrega',
                                    groupValue: formaEntrega,
                                    onChanged: (value) {
                                      setState(() {
                                        formaEntrega = value.toString();
                                      });
                                    }),
                                const Text(
                                  'Entrega',
                                  style: TextStyle(
                                      fontSize: 20, color: kTextButtonColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(children: const [
                          Text(
                            'Endereço de entrega',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ]),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 440,
                                height: 95,
                                decoration: BoxDecoration(
                                  color: kOnSurfaceColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
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
                                          'Maria Eduarda',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const VerticalSpacerBox(
                                                size: SpacerSize.medium),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      Screens.selectAdress);
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: kTextButtonColor,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: Row(
                                        children: const [
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
                                          Text(
                                            'Rua Professora Esmeralda Barros, 71, Apt, ...',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: kTextButtonColor),
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
                            Navigator.pushNamed(context, Screens.selectAdress);
                          },
                        ),
                        const VerticalSpacerBox(size: SpacerSize.medium),
                        Row(children: const [
                          Text(
                            'Informações de pagamento',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ]),
                        const VerticalSpacerBox(size: SpacerSize.medium),
                        Row(children: const [
                          Text(
                            'Formas de pagamento:',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ]),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    overlayColor:
                                        MaterialStateProperty.all(kDetailColor),
                                    value: 'Pix',
                                    groupValue: formaPag,
                                    onChanged: (value) {
                                      setState(() {
                                        formaPag = value.toString();
                                      });
                                    }),
                                const Text(
                                  'Pix',
                                  style: TextStyle(
                                      fontSize: 20, color: kTextButtonColor),
                                ),
                              ],
                            ),
                            const HorizontalSpacerBox(size: SpacerSize.small),
                            Row(
                              children: [
                                Radio(
                                    overlayColor:
                                        MaterialStateProperty.all(kDetailColor),
                                    value: 'Espécie',
                                    groupValue: formaPag,
                                    onChanged: (value) {
                                      setState(() {
                                        formaPag = value.toString();
                                      });
                                    }),
                                const Text(
                                  'Espécie',
                                  style: TextStyle(
                                      fontSize: 20, color: kTextButtonColor),
                                ),
                              ],
                            ),
                            const HorizontalSpacerBox(size: SpacerSize.small),
                            Row(
                              children: [
                                Radio(
                                    overlayColor:
                                        MaterialStateProperty.all(kDetailColor),
                                    value: 'Cartão',
                                    groupValue: formaPag,
                                    onChanged: (value) {
                                      setState(() {
                                        formaPag = value.toString();
                                      });
                                    }),
                                const Text(
                                  'Cartão',
                                  style: TextStyle(
                                      fontSize: 20, color: kTextButtonColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 440,
                                height: 110,
                                decoration: BoxDecoration(
                                  color: kOnSurfaceColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const VerticalSpacerBox(
                                                size: SpacerSize.medium),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      Screens.selectCard);
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: kTextButtonColor,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: Row(
                                        children: const [
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
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
                                          HorizontalSpacerBox(
                                              size: SpacerSize.huge),
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
                            Navigator.pushNamed(context, Screens.selectCard);
                          },
                        ),
                        const VerticalSpacerBox(size: SpacerSize.large),
                        PrimaryButton(
                          text: 'Confirmar pedido',
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const FinishPurchaseDialog());
                          },
                          color: kButtom,
                        ),
                        const VerticalSpacerBox(size: SpacerSize.medium),
                        const Divider(
                          color: kTextButtonColor,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Screens.cart);
                                },
                                child: const Text(
                                  'Voltar a cesta',
                                  style:
                                      TextStyle(color: kButtom, fontSize: 17),
                                ))
                          ],
                        ),
                      ]))))),
            ));
  }
}
