import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Text('Pagamentos'),
      ),
    );
  }
}
