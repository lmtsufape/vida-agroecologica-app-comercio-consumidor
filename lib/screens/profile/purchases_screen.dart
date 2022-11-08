import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:flutter/material.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/components/dialogs/finish_dialog.dart';
import '../../shared/constants/app_enums.dart';
import '../../shared/constants/style_constants.dart';
import '../screens_index.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({Key? key}) : super(key: key);

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
              Row(children: const [
                Text(
                  'Pedido #000001',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ]),
              const VerticalSpacerBox(size: SpacerSize.medium),
              InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 440,
                      height: 270,
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
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const FinishVisitDialog());
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
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
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Text(
                                  'Vendido por:',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Spacer(),
                                Text(
                                  'Leandro Carnes',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: kButtom),
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
                                  'Fretes e manuseio:',
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
                                  'Total do pedido:',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'RS 64,50',
                                  style: TextStyle(
                                      fontSize: 22,
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
                                  '07/10/2022',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kDetailColor),
                                  ),
                                  child: const Text(
                                    'Em andamento',
                                    style: TextStyle(
                                        fontSize: 17, color: kOnSurfaceColor),
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
                  'Pedido #000002',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ]),
              const VerticalSpacerBox(size: SpacerSize.medium),
              InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 440,
                      height: 270,
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
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const FinishVisitDialog());
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
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
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Text(
                                  'Vendido por:',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Spacer(),
                                Text(
                                  'Leandro Carnes',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: kButtom),
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
                                  'Fretes e manuseio:',
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
                                  'Total do pedido:',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'RS 64,50',
                                  style: TextStyle(
                                      fontSize: 22,
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
                                  '07/10/2022',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(kButtom),
                                  ),
                                  child: const Text(
                                    'Entregue',
                                    style: TextStyle(
                                        fontSize: 17, color: kOnSurfaceColor),
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
                  'Pedido #000003',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ]),
              const VerticalSpacerBox(size: SpacerSize.medium),
              InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 440,
                      height: 270,
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
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const FinishVisitDialog());
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
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
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Text(
                                  'Vendido por:',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Spacer(),
                                Text(
                                  'Leandro Carnes',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: kButtom),
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
                                  'Fretes e manuseio:',
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
                                  'Total do pedido:',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'RS 64,50',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: kDetailColor),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 6),
                            child: Row(
                              children: [
                                const HorizontalSpacerBox(
                                    size: SpacerSize.large),
                                const Text(
                                  '07/10/2022',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(kButtom2),
                                  ),
                                  child: const Text(
                                    'Cancelado',
                                    style: TextStyle(
                                        fontSize: 17, color: kOnSurfaceColor),
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
            ]))));
  }
}
