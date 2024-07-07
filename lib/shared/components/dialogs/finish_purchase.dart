import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

class FinishPurchaseDialog extends StatelessWidget {
  const FinishPurchaseDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Icon(
        Icons.shopping_basket,
        color: kDetailColor,
        size: 75,
      ),
      content: Text(
        'Seu pedido #001 foi confirmado e enviado ao vendedor João Frutas!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kText,
          fontSize: 15,
        ),
      ),
    );
  }
}
