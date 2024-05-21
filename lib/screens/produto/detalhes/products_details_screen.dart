// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:ecommercebonito/components/appBar/custom_app_bar.dart';
import 'package:ecommercebonito/shared/components/bottomNavigation/BottomNavigation.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants/style_constants.dart';

class ProdutoDetalheScreen extends StatefulWidget {
  const ProdutoDetalheScreen({super.key});

  @override
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
    final int produtoEstoque = arguments?['estoque'];
    final String produtoTitulo = arguments?['titulo'];
    final String produtoDescricao = arguments?['descricao'];
    final String produtoTipo = arguments?['tipoUnidade'];
    final String produtoPreco = arguments?['preco'];
    final String? base64Image = arguments?['produtoImage'];

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
                      const SizedBox(height: 15),
                      Text(produtoTitulo,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      Text(
                          'R\$ ${double.parse(produtoPreco).toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
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
                          _buildQuantityButton(Icons.add,
                              () => incrementQuantity(produtoEstoque)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  // função de adicionar ao carrinho
                },
                child: const Text('Adicionar ao carrinho',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
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
