// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:ecommerceassim/components/appBar/custom_app_bar.dart';
import 'package:ecommerceassim/screens/cesta/cart_provider.dart';
import 'package:ecommerceassim/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:ecommerceassim/shared/components/dialogs/notice_dialog.dart';
import 'package:ecommerceassim/shared/core/models/produto_model.dart';
import 'package:flutter/material.dart';
import '../../../shared/constants/style_constants.dart';

class ProdutoDetalheScreen extends StatefulWidget {
  const ProdutoDetalheScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProdutoDetalheScreenState createState() => _ProdutoDetalheScreenState();
}

class _ProdutoDetalheScreenState extends State<ProdutoDetalheScreen> {
  int quantity = 1;
  bool isDescriptionExpanded = false;

  void incrementQuantity(int maxQuantity) {
    if (quantity < maxQuantity) {
      setState(() {
        quantity++;
      });
    }
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void toggleDescription() {
    setState(() {
      isDescriptionExpanded = !isDescriptionExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments == null) {
      return const Scaffold(
        body: Center(
          child: Text('Erro ao carregar os detalhes do produto.'),
        ),
      );
    }

    final ProdutoModel produto = arguments['produto'];
    final String? base64Image = arguments['base64Image'];
    final CartProvider cartProvider = arguments['cartProvider'];
    final Function(int) addToCart = arguments['addToCart'];
    final int produtoEstoque = produto.estoque;
    final String produtoTitulo = produto.titulo;
    final String produtoDescricao = produto.descricao;
    final String produtoTipo = produto.tipoUnidade;
    final String produtoPreco = produto.preco;

    String shortDescription = produtoDescricao.length > 100
        ? '${produtoDescricao.substring(0, 100)}...'
        : produtoDescricao;

    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: BottomNavigation(),
      body: Material(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(21.0, 5.0, 21.0, 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      base64Image != null
                          ? Image.memory(
                              base64Decode(base64Image.split(',').last))
                          : const Icon(Icons.shopping_bag,
                              size: 80, color: kDetailColor),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), 
                  topRight: Radius.circular(30))
              ),
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 15),
                        Text(produtoTitulo,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        Text(
                          'R\$ ${double.parse(produtoPreco).toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(produtoTipo,
                            style: const TextStyle(
                                fontSize: 16, color: kDetailColor)),
                        const SizedBox(height: 16),
                        const Text('Descrição',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        InkWell(
                          onTap: toggleDescription,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isDescriptionExpanded
                                    ? produtoDescricao
                                    : shortDescription,
                                style: const TextStyle(fontSize: 16),
                              ),
                              if (produtoDescricao.length > 100)
                                Text(
                                  isDescriptionExpanded
                                      ? 'Ver menos'
                                      : 'Ver mais',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: kDetailColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Quantidade',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildQuantityButton(
                                Icons.remove, () => decrementQuantity()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text('$quantity',
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                            _buildQuantityButton(Icons.add, () {
                              if (quantity <
                                  produto.estoque -
                                      cartProvider
                                          .getProductQuantity(produto.id)) {
                                incrementQuantity(produtoEstoque);
                              }
                            }),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: kDetailColor,
                          side: const BorderSide(color: kDetailColor, width: 2.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          if (quantity <=
                              produto.estoque -
                                  cartProvider.getProductQuantity(produto.id)) {
                            addToCart(quantity);
                            setState(() {
                              quantity = 1;
                            });
                            print('Produto adicionado a cesta');
                          } else {
                            setState(() {
                              quantity = 1;
                            });
                            alertDialog(context, 'Produto Esgotado',
                                'A quantidade disponível do produto já foi adicionada à cesta ou não está mais em estoque.');
                            print(
                                'produto nao adicionado a cesta porque nao tem mais o produto no estoque');
                          }
                        },
                        child: const Text('Adicionar ao carrinho',
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 40,
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: Colors.black,
          iconSize: 15,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
    );
  }
}
