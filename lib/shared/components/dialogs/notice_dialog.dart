import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

class NoticeDialog extends StatelessWidget {
  final String message;
  final String title;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const NoticeDialog({
    super.key,
    required this.title,
    required this.message,
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
                child: const Text('Ok',
                    style: TextStyle(
                      color: kDarkTextColor,
                    )),
                onPressed: () {
                  if (onCancel != null) {
                    onCancel!();
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

void alertDialog(BuildContext context, String title, String message,
    {VoidCallback? onConfirm, VoidCallback? onCancel}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return NoticeDialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}
