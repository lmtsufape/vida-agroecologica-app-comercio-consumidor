// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/components/dialogs/notice_dialog.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:ecommerceassim/shared/core/models/produto_model.dart';
import 'package:ecommerceassim/shared/core/models/table_products_model.dart';
import 'package:flutter/material.dart';
import '../../../shared/core/models/cart_model.dart';
import '../../cesta/cart_provider.dart';
import '../../../shared/core/controllers/products_controller.dart';

// ignore: must_be_immutable
class BuildProductCard extends StatefulWidget {
  final ProdutoModel produto;
  final ProductsController controller;
  final CartProvider cartProvider;
  CartModel? cartModel;

   BuildProductCard(this.produto, this.controller, this.cartProvider,
      {super.key});

  @override
  State<BuildProductCard> createState() => _BuildProductCardState();
}

class _BuildProductCardState extends State<BuildProductCard> {
  @override
  Widget build(BuildContext context) {
    TableProductsModel? tableProductsModel = returnProdutoTabelado(
        widget.produto.produtoTabeladoId, widget.controller.listTableProducts);

    String? base64Image = tableProductsModel != null &&
            tableProductsModel.imagem != null
        ? 'data:image/jpeg;base64,${base64Encode(tableProductsModel.imagem!)}'
        : null;

    void addToCart(int quantity) {
      CartModel cart = widget.controller.createCart(context, quantity, widget.produto);
      widget.cartProvider.addCart(cart);
    }

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Screens.produtoDetalhe,
          arguments: {
            'produto': widget.produto,
            'base64Image': base64Image,
            'controller': widget.controller,
            'cartProvider': widget.cartProvider,
            'addToCart': addToCart,
          },
        );
      },
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: base64Image != null
                      ? Image.memory(base64Decode(base64Image.split(',').last))
                      : const Icon(
                          Icons.shopping_bag,
                          size: 80,
                          color: kDetailColor,
                        ),
                ),
              ),
              Text(
                widget.produto.titulo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF858080),
                ),
              ),
              Text(
                'R\$ ${double.parse(widget.produto.preco).toStringAsFixed(2).replaceAll('.', ',')}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    capitalize(widget.produto.tipoUnidade),
                    style: const TextStyle(fontSize: 18, color: kDetailColor),
                  ),
                  IconButton(
                    onPressed: (){
                      if(widget.produto.estoque > widget.cartProvider.getProductQuantity(widget.produto.id)){
                        addToCart(1);
                        print('Produto adicionado ao carrinho +1');
                      }else {
                    alertDialog(context, 'Produto Esgotado', 'A quantidade disponível do produto já foi adicionada à cesta ou não está mais em estoque.');
                        print("Produto nao adicionado a cesta porque nao tem mais o produto no estoque");
                      }
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: kDetailColor,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TableProductsModel? returnProdutoTabelado(
    int id, List<TableProductsModel>? listaProdutos) {
  if (listaProdutos != null) {
    for (int i = 0; i < listaProdutos.length; i++) {
      if (listaProdutos[i].id == id) {
        return listaProdutos[i];
      }
    }
  }
  return null;
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}
