import 'package:ecommercebonito/assets/index.dart';
import 'package:ecommercebonito/screens/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../../components/buttons/primary_button.dart';

class FinalizePurchaseScreen extends StatefulWidget {
  const FinalizePurchaseScreen({Key? key}) : super(key: key);

  @override
  State<FinalizePurchaseScreen> createState() => _FinalizePurchaseScreenState();
}

class _FinalizePurchaseScreenState extends State<FinalizePurchaseScreen> {
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
                                height: 280,
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
                                            style: TextStyle(fontSize: 17),
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
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 6),
                                      child: Row(
                                        children: [
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
                                                fontSize: 20,
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
                                        children: [
                                          const HorizontalSpacerBox(
                                              size: SpacerSize.large),
                                          const Text(
                                            'Itens:',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'R\$ ${controller.total}',
                                            style: const TextStyle(
                                              fontSize: 20,
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
                                        children: [
                                          const HorizontalSpacerBox(
                                              size: SpacerSize.large),
                                          const Text(
                                            'Taxa de entrega:',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'R\$ ${controller.taxaEntrega}',
                                            style: const TextStyle(
                                              fontSize: 20,
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
                                        children: [
                                          const HorizontalSpacerBox(
                                              size: SpacerSize.large),
                                          const Text(
                                            'Total do pedido:',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'R\$ ${controller.taxaEntrega + controller.total}',
                                            style: const TextStyle(
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
                                                fontSize: 17,
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
                                                  fontSize: 17,
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
                        const Row(children: [
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
                                    groupValue: 'Retirada',
                                    activeColor: kDetailColor,
                                    focusColor: kDetailColor,
                                    hoverColor: kDetailColor,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.setFormEnt(value.toString());
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
                                    groupValue: 'Entrega',
                                    activeColor: kDetailColor,
                                    focusColor: kDetailColor,
                                    hoverColor: kDetailColor,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.setFormEnt(value.toString());
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
                        const Row(children: [
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
                                    const Center(
                                      child: Row(
                                        children: [
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
                        const Row(children: [
                          Text(
                            'Informações de pagamento',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ]),
                        const VerticalSpacerBox(size: SpacerSize.medium),
                        const Row(children: [
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
                                    activeColor: kDetailColor,
                                    focusColor: kDetailColor,
                                    hoverColor: kDetailColor,
                                    value: 'Pix',
                                    groupValue: 'Pix',
                                    onChanged: (value) {
                                      setState(() {
                                        controller.setFormPag(value.toString());
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
                                    activeColor: kDetailColor,
                                    focusColor: kDetailColor,
                                    hoverColor: kDetailColor,
                                    value: 'Espécie',
                                    groupValue: 'Espécie',
                                    onChanged: (value) {
                                      setState(() {
                                        controller.setFormPag(value.toString());
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
                                    activeColor: kDetailColor,
                                    focusColor: kDetailColor,
                                    hoverColor: kDetailColor,
                                    groupValue: 'Cartão',
                                    onChanged: (value) {
                                      setState(() {
                                        controller.setFormPag(value.toString());
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
                                    const Center(
                                      child: Row(
                                        children: [
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
                                    const Center(
                                      child: Row(
                                        children: [
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
                        InkWell(
                          child: Container(
                            width: 440,
                            height: 300,
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
                                        width: 75.0,
                                        height: 75.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              "http://faq-login-unico.servicos.gov.br/en/latest/_images/imagem_qrcode_exemplo.jpg",
                                            ),
                                          ),
                                        ),
                                      ),
                                      const HorizontalSpacerBox(
                                          size: SpacerSize.large),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                Assets.pix,
                                                width: 180,
                                                height: 100,
                                              ),
                                              // Text(
                                              //   'PIX: CHAVES',
                                              //   style: TextStyle(
                                              //       fontSize: 26,
                                              //       fontWeight:
                                              //           FontWeight.bold),
                                              // ),
                                            ],
                                          ),
                                          const VerticalSpacerBox(
                                              size: SpacerSize.small),
                                          const Row(
                                            children: [
                                              Text(
                                                'Nome: João da Silva',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                selectionColor: kText,
                                              ),
                                            ],
                                          ),
                                          const Row(
                                            children: [
                                              Text(
                                                'Tipo de Chave: QR Code',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                selectionColor: kText,
                                              ),
                                            ],
                                          ),
                                          const VerticalSpacerBox(
                                              size: SpacerSize.medium),
                                          const Row(
                                            children: [
                                              HorizontalSpacerBox(
                                                  size: SpacerSize.huge),
                                              HorizontalSpacerBox(
                                                  size: SpacerSize.medium),
                                              Text(
                                                'Chave aleatória',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                selectionColor: kText,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                color: kColorBottom,
                                                height: 25,
                                                width: 225,
                                                child: const Center(
                                                  child: Text(
                                                    'edjsd-574757-dsdijsd4',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    selectionColor: kText,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () => {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          backgroundColor:
                                                              kDetailColor,
                                                          content: Text(
                                                              'Copiado para área de transferência')))
                                                },
                                                icon: const Icon(
                                                  Icons.copy,
                                                  color: kTextButtonColor,
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: null,
                                            child: Row(
                                              children: [
                                                Container(
                                                  color: kDetailColor,
                                                  height: 30,
                                                  width: 225,
                                                  child: const Center(
                                                    child: Text(
                                                      'Comprovante de pagamento',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kText),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () => {},
                                                  icon: const Icon(
                                                    Icons.archive,
                                                    color: kDetailColor,
                                                    size: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                        const VerticalSpacerBox(size: SpacerSize.large),
                        PrimaryButton(
                          text: 'Confirmar pedido',
                          onPressed: () {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) =>
                            //         const FinishPurchaseDialog());
                            showDialog(
                                context: context,
                                builder: (context) => RatingDialog(
                                      starColor: Colors.amber,
                                      title: const Text('Que tal nos avaliar?'),
                                      message: const Text(
                                          'Dê uma nota para o seu pedido'),
                                      image: Image.asset(
                                        Assets.feedback,
                                        height: 250,
                                      ),
                                      submitButtonText: 'Enviar',
                                      // ignore: avoid_print
                                      onCancelled: () =>
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  backgroundColor: kButtom2,
                                                  content: Text('Cancelado'))),
                                      onSubmitted: (response) {
                                        controller.setRating(response.rating);
                                        controller.setComment(response.comment);
                                      },
                                    ));
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
