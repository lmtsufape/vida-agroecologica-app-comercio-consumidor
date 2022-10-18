import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text('Compras'),
      ),
    );
  }
}
