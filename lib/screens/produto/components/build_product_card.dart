// ignore_for_file: must_be_immutable
import 'dart:convert';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import 'package:ecommercebonito/shared/core/models/produto_model.dart';
import 'package:ecommercebonito/shared/core/models/table_products_model.dart';
import 'package:flutter/material.dart';
import '../../../shared/core/models/cart_model.dart';
import '../../cesta/cart_provider.dart';
import '../../../shared/core/controllers/products_controller.dart';

class BuildProductCard extends StatefulWidget {
  ProdutoModel produto;
  ProductsController controller;
  CartProvider cartProvider;
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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Screens.produtoDetalhe,
          arguments: {
            'id': widget.produto.id,
            'titulo': widget.produto.titulo,
            'descricao': widget.produto.descricao,
            'tipoUnidade': widget.produto.tipoUnidade,
            'preco': widget.produto.preco,
            'estoque': widget.produto.estoque,
            'produtoImage': base64Image,
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
                    onPressed: () {
                      CartModel card = widget.controller
                          .createCart(context, 1, widget.produto);
                      widget.cartProvider.addCart(card);
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
