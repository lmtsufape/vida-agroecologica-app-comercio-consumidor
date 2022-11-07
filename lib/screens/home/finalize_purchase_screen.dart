import 'package:ecommercebonito/components/buttons/primary_button.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/components/dialogs/finish_purchase.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:flutter/material.dart';
import '../../components/utils/horizontal_spacer_box.dart';
import '../../components/utils/vertical_spacer_box.dart';

class FinalizePurchaseScreen extends StatelessWidget {
  const FinalizePurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? formaEntrega;
    String? formaPag;
    ;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        body: Container(
            color: Colors.white,
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
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
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
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1,
                            indent: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            child: Row(
                              children: const [
                                HorizontalSpacerBox(size: SpacerSize.large),
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
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          const VerticalSpacerBox(size: SpacerSize.small),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            child: Row(
                              children: const [
                                HorizontalSpacerBox(size: SpacerSize.large),
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
                                HorizontalSpacerBox(size: SpacerSize.large),
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
                                HorizontalSpacerBox(size: SpacerSize.large),
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
                                      color: Colors.orange),
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
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orange),
                                  ),
                                  child: const Text(
                                    'Alterar',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
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
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                              MaterialStateProperty.all(Colors.orange),
                          value: 'Retirada',
                          groupValue: formaEntrega,
                          onChanged: (value) {
                            formaEntrega = value.toString();
                          }),
                      const Text(
                        'Retirada',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                  const HorizontalSpacerBox(size: SpacerSize.small),
                  Row(
                    children: [
                      Radio(
                          overlayColor:
                              MaterialStateProperty.all(Colors.orange),
                          value: 'Entrega',
                          groupValue: formaEntrega,
                          onChanged: (value) {
                            formaEntrega = value.toString();
                          }),
                      const Text(
                        'Entrega',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const VerticalSpacerBox(size: SpacerSize.small),
              Row(children: const [
                Text(
                  'Endereço de entrega',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
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
                                            context, Screens.selectAdress);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.grey,
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
                                  'Rua Professora Esmeralda Barros, 71, Apt, ...',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
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
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ]),
              const VerticalSpacerBox(size: SpacerSize.medium),
              Row(children: const [
                Text(
                  'Formas de pagamento:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                              MaterialStateProperty.all(Colors.orange),
                          value: 'Pix',
                          groupValue: formaPag,
                          onChanged: (value) {
                            formaPag = value.toString();
                          }),
                      const Text(
                        'Pix',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                  const HorizontalSpacerBox(size: SpacerSize.small),
                  Row(
                    children: [
                      Radio(
                          overlayColor:
                              MaterialStateProperty.all(Colors.orange),
                          value: 'Espécie',
                          groupValue: formaPag,
                          onChanged: (value) {
                            formaPag = value.toString();
                          }),
                      const Text(
                        'Espécie',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                  const HorizontalSpacerBox(size: SpacerSize.small),
                  Row(
                    children: [
                      Radio(
                          overlayColor:
                              MaterialStateProperty.all(Colors.orange),
                          value: 'Cartão',
                          groupValue: formaPag,
                          onChanged: (value) {
                            formaPag = value.toString();
                          }),
                      const Text(
                        'Cartão',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
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
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
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
                                            context, Screens.selectCard);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.grey,
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
                  Navigator.pushNamed(context, Screens.selectCard);
                },
              ),
              const VerticalSpacerBox(size: SpacerSize.large),
              PrimaryButton(
                text: 'Confirmar pedido',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const FinishPurchaseDialog());
                },
                color: Colors.green,
              ),
              const VerticalSpacerBox(size: SpacerSize.medium),
              const Divider(
                color: Colors.grey,
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
                        style: TextStyle(color: Colors.green, fontSize: 17),
                      ))
                ],
              ),
            ]))));
  }
}
