import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:flutter/material.dart';

import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/components/dialogs/finish_dialog.dart';
import '../../shared/constants/app_enums.dart';

class SelectAdress extends StatelessWidget {
  const SelectAdress({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
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
            width: size.width,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(children: [
              const VerticalSpacerBox(size: SpacerSize.small),
              Row(
                children: const [
                  Text(
                    'Selecionar um endereço de envio',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
              const VerticalSpacerBox(size: SpacerSize.large),
              InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 440,
                      height: 225,
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
                                width: 35.0,
                                height: 55.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Text(
                                'USADO RECENTEMENTE',
                                style: TextStyle(fontSize: 20),
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
                                    Icons.delete,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          Row(
                            children: const [
                              HorizontalSpacerBox(size: SpacerSize.large),
                              Text('Eduarda'),
                            ],
                          ),
                          Row(
                            children: const [
                              HorizontalSpacerBox(size: SpacerSize.large),
                              Text(
                                'Rua Professora Esmeralda Barros, 67',
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              HorizontalSpacerBox(size: SpacerSize.large),
                              Text('Apartamento'),
                            ],
                          ),
                          Row(
                            children: const [
                              HorizontalSpacerBox(size: SpacerSize.large),
                              Text('Caruaru, PE, 55044-070'),
                            ],
                          ),
                          Row(
                            children: const [
                              HorizontalSpacerBox(size: SpacerSize.large),
                              Text('Brasil'),
                            ],
                          ),
                          Row(
                            children: const [
                              HorizontalSpacerBox(size: SpacerSize.large),
                              Text('Telefone: (81) 99699-7476'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () async {},
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
                                  'Adicione um novo endereço',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Screens.adress);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
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
                  Navigator.pushNamed(context, Screens.adress);
                },
              ),
            ]))));
  }
}
