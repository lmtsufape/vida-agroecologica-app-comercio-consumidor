import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  final String message;
  final String title;
  final String textCancelar;
  final String textConfirmar;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const AlertMessage({
    super.key,
    required this.title,
    required this.message,
    required this.textCancelar,
    required this.textConfirmar,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Center(
          child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(114, 50)),
                  backgroundColor: const MaterialStatePropertyAll(kDetailColor),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: Text(textCancelar,
                    style: const TextStyle(
                      color: kDarkTextColor,
                    )),
                onPressed: () {
                  if (onCancel != null) {
                    onCancel!();
                  }
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(114, 50)),
                  backgroundColor: const MaterialStatePropertyAll(kErrorColor),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: Text(textConfirmar,
                    style: const TextStyle(
                      color: kDarkTextColor,
                    )),
                onPressed: () {
                  if (onConfirm != null) {
                    onConfirm!();
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

confirmDialog(BuildContext context, String title, String message,
    String textCancelar, String textConfirmar,
    {VoidCallback? onConfirm, VoidCallback? onCancel}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertMessage(
        title: title,
        message: message,
        textCancelar: textCancelar,
        textConfirmar: textConfirmar,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}
