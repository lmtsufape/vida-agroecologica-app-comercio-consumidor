// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:ecommerceassim/components/buttons/primary_button.dart';
import 'package:ecommerceassim/components/spacer/verticalSpacer.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/shared/core/controllers/profile_controller.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import '../../../components/utils/vertical_spacer_box.dart';
import '../../../shared/constants/app_enums.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({super.key});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileController>().fetchUserAddresses();
    });
  }

  Future<void> _deleteAddress(String id, String token) async {
    final url = '$kBaseURL/users/enderecos/$id';
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        context.read<ProfileController>().fetchUserAddresses();
      } else {
        print('Falha ao excluir endereço: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao excluir endereço: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: BottomNavigation(paginaSelecionada: 3),
      backgroundColor: Colors.white,
      body: Container(
        color: kOnSurfaceColor,
        width: size.width,
        padding: const EdgeInsets.all(20),
        child: Consumer<ProfileController>(
          builder: (context, controller, child) {
            if (controller.addresses.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kDetailColor,
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const VerticalSpacerBox(size: SpacerSize.small),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Endereços cadastrados',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const VerticalSpacerBox(size: SpacerSize.medium),
                  ...controller.addresses.map((address) {
                    return Container(
                        width: 350,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                        decoration: BoxDecoration(
                          color: kOnSurfaceColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: kTextButtonColor.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: address.rua),
                                        const TextSpan(text: ',\n'),
                                        TextSpan(text: address.numero),
                                      ],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (controller.addresses.length >
                                    1) // Condicional para mostrar o botão
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      bool confirmDelete = await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            title: const Text(
                                              'Excluir endereço',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            content: const Text(
                                              'Tem certeza de que deseja excluir este endereço?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(20),
                                            actionsAlignment:
                                                MainAxisAlignment.center,
                                            actions: <Widget>[
                                              SizedBox(
                                                width: double.maxFinite,
                                                child: Wrap(
                                                  alignment:
                                                      WrapAlignment.center,
                                                  spacing: 30,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            kDetailColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        minimumSize:
                                                            const Size(114, 50),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(false);
                                                      },
                                                      child: const Text(
                                                          'Cancelar',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            kErrorColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        minimumSize:
                                                            const Size(114, 50),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(true);
                                                      },
                                                      child: const Text(
                                                          'Excluir',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      if (confirmDelete == true) {
                                        String token =
                                            await UserStorage().getUserToken();
                                        await _deleteAddress(
                                            address.id.toString(), token);
                                      }
                                    },
                                  ),
                              ],
                            ),
                            const VerticalSpacer(size: 10),
                            if (address.complemento != null)
                              Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  address.complemento!,
                                  style: const TextStyle(
                                      fontSize: 18, color: kTextButtonColor),
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                address.cep,
                                style: const TextStyle(
                                    fontSize: 18, color: kTextButtonColor),
                              ),
                            ),
                            Text(
                              '${address.bairroNome}',
                              style: const TextStyle(
                                  fontSize: 18, color: kTextButtonColor),
                            ),
                            const VerticalSpacer(size: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${address.cidadeNome}',
                                  style: const TextStyle(
                                      fontSize: 18, color: kTextButtonColor),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          Screens.addressEdit,
                                          arguments: {
                                            'id': address.id,
                                            'rua': address.rua,
                                            'numero': address.numero,
                                            'cep': address.cep,
                                            'complemento': address.complemento,
                                            'bairroId': address.bairroId,
                                            'cidadeId': address.cidadeId,
                                            'bairroNome': address.bairroNome,
                                            'cidadeNome': address.cidadeNome,
                                          },
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            side: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                        ),
                                        elevation: MaterialStateProperty.all(0),
                                      ),
                                      child: const Text(
                                        'Editar',
                                        style: TextStyle(
                                            fontSize: 15, color: kTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ));
                  }),
                  SizedBox(
                    width: 350, // Largura do card
                    child: PrimaryButton(
                      text: "Adicionar novo endereço",
                      onPressed: () =>
                          Navigator.pushNamed(context, Screens.adress),
                      color: kDetailColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
