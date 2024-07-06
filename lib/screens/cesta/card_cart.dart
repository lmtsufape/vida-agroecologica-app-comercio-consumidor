import 'dart:convert';
import 'dart:developer';

import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ecommerceassim/shared/components/dialogs/confirm_dialog.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:ecommerceassim/shared/core/models/cart_model.dart';
import 'package:ecommerceassim/shared/core/models/table_products_model.dart';
import 'package:ecommerceassim/screens/cesta/cart_controller.dart';
import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'cart_provider.dart';

// ignore: must_be_immutable
class CardCart extends StatefulWidget {
  CartModel model;
  CartController? controller;

  CardCart(this.model, this.controller, {Key? key}) : super(key: key);

  @override
  State<CardCart> createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  @override
  Widget build(BuildContext context) {
    print(widget.controller?.listTableProducts.length);
    TableProductsModel? tableProductsModel = widget.controller
        ?.returnProdutoTabelado(widget.model.produtoTabeladoId!);
    String? base64Image = tableProductsModel != null &&
            tableProductsModel.imagem != null
        ? 'data:image/jpeg;base64,${base64Encode(tableProductsModel.imagem!)}'
        : null;
    final cartListProvider = Provider.of<CartProvider>(context);
    log(widget.model.nameProduct.toString());
    Size size = MediaQuery.of(context).size;
    double? doublePrice = double.tryParse(widget.model.price!);
    String rightPrice =
        NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
            .format(doublePrice);
    return InkWell(
      onTap: () {
        _showProductDetailsModal(context);
      },
      child: Container(
        width: size.width * 0.7,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          color: kOnSurfaceColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: kTextButtonColor.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 0),
            ),
          ],
          border: Border.all(
            color: kTextButtonColor.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Center(
          child: Wrap(
            children: [
              Row(
                children: [
                  const HorizontalSpacerBox(size: SpacerSize.large),
                  SizedBox(
                    width: size.width * 0.3,
                    height: size.height * 0.1,
                    child: Center(
                      child: base64Image != null
                          ? Image.memory(
                              base64Decode(base64Image.split(',').last))
                          : const Icon(
                              Icons.shopping_bag,
                              size: 80,
                              color: kDetailColor,
                            ),
                    ),
                  ),
                  const HorizontalSpacerBox(size: SpacerSize.small),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpacerBox(size: SpacerSize.large),
                      Container(
                        width: size.width * 0.42,
                        alignment: AlignmentDirectional.topStart,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            widget.model.nameProduct.toString(),
                            style: TextStyle(
                                fontSize: size.height * 0.024,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const VerticalSpacerBox(size: SpacerSize.medium),
                      Row(
                        children: [
                          Text(
                            rightPrice.toString(),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                          const HorizontalSpacerBox(size: SpacerSize.tiny),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                    ],
                  ),
                ],
              ),
              const HorizontalSpacerBox(size: SpacerSize.huge),
              const Text(
                'Quantidade:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
              ),
              Row(
                children: [
                  const HorizontalSpacerBox(size: SpacerSize.small),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (widget.model.amount > 1) {
                        setState(() {
                          widget.model.amount--;
                          widget.controller?.decrementCounter();
                          cartListProvider.itens--;
                          cartListProvider.total -= doublePrice!;
                        });
                      } else {
                        confirmDialog(
                          context,
                          "Remover produto",
                          "Tem certeza que deseja remover esse produto da cesta?",
                          "Cancelar",
                          "Remover",
                          onConfirm: () {
                            cartListProvider.removeCart(widget.model);
                          },
                        );
                      }
                    },
                  ),
                  const HorizontalSpacerBox(size: SpacerSize.small),
                  Text(
                    widget.model.amount.toString(),
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.end,
                  ),
                  const HorizontalSpacerBox(size: SpacerSize.small),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        if (widget.model.amount < widget.model.stock) {
                          widget.model.amount++;
                          widget.controller?.incrementCounter();
                          cartListProvider.itens++;
                          cartListProvider.total += doublePrice!;
                        }
                      });
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: kTextButtonColor,
                    onPressed: () {
                      confirmDialog(
                        context,
                        "Remover produto",
                        "Tem certeza que deseja remover esse produto da cesta?",
                        "Cancelar",
                        "Remover",
                        onConfirm: () {
                          cartListProvider.removeCart(widget.model);
                        },
                      );
                    },
                  ),
                  const HorizontalSpacerBox(size: SpacerSize.medium),
                ],
              ),
              const VerticalSpacerBox(size: SpacerSize.tiny),
            ],
          ),
        ),
      ),
    );
  }

  // Método para mostrar o modal de detalhes do produto
  void _showProductDetailsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Container(
          // Container que irá subir ao clicar no produto
          width: 400, // Largura do container
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), //Borda do Container
            color: kOnBackgroundColorText, // Cor de fundo do caontainer
          ),
          padding: EdgeInsets.all(16), // Espaçamento interno do Container
          child: Column(
            // Forma que os Widgets irão fiar alinhados no Container
            crossAxisAlignment: CrossAxisAlignment
                .start, // Widgets ficarão alinhados ao lado esquerdo do container
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.model.nameProduct ?? 'Nome do Produto',
                style: TextStyle(
                    fontSize: 18, // Tamanho da fonte do texto
                    fontWeight: FontWeight.bold, // Adicionando Negrito no texto
                    color: kDetailColor),
              ),
              SizedBox(height: 8),
              Text(
                'Preço: ${widget.model.price ?? 'Preço Indisponível'}', // Buscando valores no Model da aplicação
                style: TextStyle(fontSize: 16, color: kDetailColor),
              ),
              SizedBox(height: 8),
              Text(
                'Descrição do Produto',
                style: TextStyle(fontSize: 16, color: kDetailColor),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
