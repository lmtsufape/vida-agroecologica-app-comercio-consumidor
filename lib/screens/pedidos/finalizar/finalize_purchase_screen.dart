// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/screens/cesta/cart_provider.dart';
import 'package:ecommerceassim/shared/core/controllers/profile_controller.dart';
import 'package:ecommerceassim/shared/core/controllers/purchase_controller.dart';
import 'package:ecommerceassim/shared/core/models/cart_model.dart';
import 'package:ecommerceassim/shared/core/models/endereco_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../components/buttons/primary_button.dart';

class FinalizePurchaseScreen extends StatefulWidget {
  final List<CartModel> cartModel;
  final Map<String, dynamic>? addressData;

  const FinalizePurchaseScreen(this.cartModel, {this.addressData, super.key});

  @override
  State<FinalizePurchaseScreen> createState() => _FinalizePurchaseScreenState();
}

class _FinalizePurchaseScreenState extends State<FinalizePurchaseScreen> {
  String _deliveryMethod = 'retirada';
  int _paymentMethodId = 1;
  AddressModel? userAddress;
  bool isLoading = true;
  late int selectedAddressId;

  @override
  void initState() {
    super.initState();
    _loadUserAddress();
  }

  Future<void> _loadUserAddress() async {
    final profileController =
        Provider.of<ProfileController>(context, listen: false);
    await profileController.fetchUserAddresses();
    setState(() {
      if (profileController.addresses.isNotEmpty) {
        userAddress = profileController.addresses.first;
        selectedAddressId = userAddress!.id;
      }
      isLoading = false;
    });
  }

  void _chooseAddress(
      BuildContext context, ProfileController controller) async {
    final AddressModel? selectedAddress = await showDialog<AddressModel>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Escolha um endereço!',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.addresses.length,
              itemBuilder: (BuildContext context, int index) {
                var address = controller.addresses[index];
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text('${address.rua}, ${address.numero}'),
                  subtitle:
                      Text('${address.cidadeNome}, ${address.bairroNome} '),
                  onTap: () => Navigator.pop(context, address),
                );
              },
            ),
          ),
        );
      },
    );
    if (selectedAddress != null) {
      setState(() {
        userAddress = selectedAddress;
        selectedAddressId = selectedAddress.id;
        print("ENDEREÇO: $selectedAddressId");
      });
    }
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Pedido realizado!',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          content:
              const Icon(Icons.shopping_bag, size: 100, color: kDetailColor),
          actions: <Widget>[
            PrimaryButton(
              text: "OK",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Screens.home,
                  (Route<dynamic> route) => false,
                );
              },
              color: kDetailColor,
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Erro',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          content: Text(
            message,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            PrimaryButton(
              text: "OK",
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: kDetailColor,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartListProvider = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    final profileController =
        Provider.of<ProfileController>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Scaffold(
              backgroundColor: Colors.white,
              appBar: CustomAppBar(),
              body:
                  Center(child: CircularProgressIndicator(color: kDetailColor)))
          : GetBuilder<PurchaseController>(
              init: PurchaseController(listCartModel: widget.cartModel),
              builder: (controller) {
                controller.listCartModel = widget.cartModel;
                return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: const CustomAppBar(),
                  body: Container(
                    color: Colors.white,
                    width: size.width,
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Forma de entrega',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  overlayColor:
                                      MaterialStateProperty.all(kDetailColor),
                                  value: 'retirada',
                                  groupValue: _deliveryMethod,
                                  activeColor: kDetailColor,
                                  focusColor: kDetailColor,
                                  hoverColor: kDetailColor,
                                  onChanged: (value) {
                                    setState(() {
                                      _deliveryMethod = value.toString();
                                      print(
                                          "Tipo de entrega: $_deliveryMethod");
                                    });
                                  }),
                              const Text(
                                'Retirada',
                                style: TextStyle(
                                    fontSize: 20, color: kTextButtonColor),
                              ),
                              const HorizontalSpacerBox(size: SpacerSize.small),
                              /* Radio(
                                  overlayColor:
                                      MaterialStateProperty.all(kDetailColor),
                                  value: 'entrega',
                                  groupValue: _deliveryMethod,
                                  activeColor: kDetailColor,
                                  focusColor: kDetailColor,
                                  hoverColor: kDetailColor,
                                  onChanged: (value) {
                                    setState(() {
                                      _deliveryMethod = value.toString();
                                      print(
                                          "Tipo de entrega: $_deliveryMethod");
                                    });
                                  }),
                              const Text(
                                'Entrega',
                                style: TextStyle(
                                    fontSize: 20, color: kTextButtonColor),
                              ), */
                              const HorizontalSpacerBox(size: SpacerSize.small),
                            ],
                          ),
                          const VerticalSpacerBox(size: SpacerSize.medium),
                          const Row(
                            children: [
                              Text(
                                'Forma de pagamento',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const VerticalSpacerBox(size: SpacerSize.small),
                          DropdownButtonFormField<int>(
                            value: _paymentMethodId,
                            onChanged: (int? value) {
                              setState(() {
                                _paymentMethodId = value ?? 1;
                              });
                            },
                            items: const [
                              DropdownMenuItem<int>(
                                value: 1,
                                child: Text(
                                  'Dinheiro',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 2,
                                child: Text(
                                  'Pix',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              /* DropdownMenuItem<int>(
                                value: 3,
                                child: Text(
                                  'Crédito',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 4,
                                child: Text(
                                  'Débito',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 5,
                                child: Text(
                                  'Boleto',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ), */
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding:
                                  const EdgeInsets.fromLTRB(13, 13, 13, 13),
                            ),
                          ),
                          const VerticalSpacerBox(size: SpacerSize.large),
                          if (_deliveryMethod == 'entrega')
                            InkWell(
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: kOnSurfaceColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kTextButtonColor.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 3,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                  border: Border(
                                    left: BorderSide(
                                      color: kTextButtonColor.withOpacity(0.5),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: kTextButtonColor.withOpacity(0.5),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Endereço de entrega',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () => _chooseAddress(
                                                context, profileController),
                                            icon: const Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: kTextButtonColor,
                                            )),
                                      ],
                                    ),
                                    const VerticalSpacerBox(
                                        size: SpacerSize.tiny),
                                    Text(
                                      'Bairro: ${userAddress?.bairroNome ?? 'Bairro não disponível'}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    const VerticalSpacerBox(
                                        size: SpacerSize.tiny),
                                    Text(
                                      'Cidade: ${userAddress?.cidadeNome ?? 'Cidade não disponível'}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    const VerticalSpacerBox(
                                        size: SpacerSize.tiny),
                                    Text(
                                      'Rua: ${userAddress?.rua ?? 'Rua não disponível'}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    const VerticalSpacerBox(
                                        size: SpacerSize.tiny),
                                    Text(
                                      'Número: ${userAddress?.numero ?? 'Número não disponível'}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    const VerticalSpacerBox(
                                        size: SpacerSize.tiny),
                                    if (userAddress?.complemento != null)
                                      Text(
                                        'Complemento: ${userAddress?.complemento}',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                          const VerticalSpacerBox(size: SpacerSize.medium),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
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
                                border: Border(
                                  left: BorderSide(
                                    color: kTextButtonColor.withOpacity(0.5),
                                    width: 1,
                                  ),
                                  right: BorderSide(
                                    color: kTextButtonColor.withOpacity(0.5),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Resumo de valores',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  const VerticalSpacerBox(
                                      size: SpacerSize.tiny),
                                  /*  Row(
                                    children: [
                                      const Text(
                                        'Total:',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'R\$ ${controller.totalValue.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: kTextButtonColor),
                                      ),
                                    ],
                                  ), */
                                  const VerticalSpacerBox(
                                      size: SpacerSize.small),
                                  /*  if (_deliveryMethod == 'entrega')
                                    const Row(
                                      children: [
                                        Text(
                                          'Frete:',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Spacer(),
                                        Text(
                                          'R\$ 5.00',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: kTextButtonColor),
                                        ),
                                      ],
                                    ), */
                                  if (_deliveryMethod == 'retirada')
                                    const Row(
                                      children: [
                                        /*  Text(
                                          'Frete:',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Spacer(),
                                        Text(
                                          'R\$ 0.00',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: kTextButtonColor),
                                        ), */
                                      ],
                                    ),
                                  /*             const VerticalSpacerBox(
                                      size: SpacerSize.small), */
                                  Row(
                                    children: [
                                      const Text(
                                        'Total:',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        _deliveryMethod == 'entrega'
                                            ? 'R\$ ${(controller.totalValue + 5).toStringAsFixed(2)}'
                                            : 'R\$ ${controller.totalValue.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: kTextButtonColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                          const VerticalSpacerBox(size: SpacerSize.large),
                          PrimaryButton(
                            text: 'Confirmar pedido',
                            onPressed: () async {
                              bool success;
                              try {
                                success = await controller.purchase(
                                  selectedAddressId,
                                  _deliveryMethod,
                                  _paymentMethodId,
                                );
                              } catch (e) {
                                String errorMessage = e.toString();
                                if (errorMessage.startsWith('Exception: ')) {
                                  errorMessage = errorMessage.replaceFirst(
                                      'Exception: ', '');
                                } else if (errorMessage
                                    .contains('Exception: ')) {
                                  errorMessage =
                                      errorMessage.split('Exception: ')[1];
                                }
                                showErrorDialog(context, errorMessage);
                                return;
                              }
                              if (success) {
                                cartListProvider.clearCart();
                                print("ENDEREÇO: $selectedAddressId");
                                print("Tipo de entrega: $_deliveryMethod");
                                print("Forma de pagamento: $_paymentMethodId");
                                print("Compra realizada com sucesso!");
                                showSuccessDialog(context);
                              } else {
                                print("Falha na compra.");
                                showErrorDialog(
                                    context, 'Falha ao realizar a compra.');
                              }
                            },
                            color: kDetailColor,
                          ),
                          const VerticalSpacerBox(size: SpacerSize.medium),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Screens.cart);
                                },
                                child: const Text(
                                  'Voltar a cesta',
                                  style: TextStyle(
                                      color: kDetailColor, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
