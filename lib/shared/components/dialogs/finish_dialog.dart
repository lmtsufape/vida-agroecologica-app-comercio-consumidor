import 'package:ecommercebonito/components/utils/horizontal_spacer_box.dart';
import 'package:ecommercebonito/shared/constants/app_enums.dart';
import 'package:flutter/material.dart';

import '../../../screens/home/home_screen.dart';

class FinishVisitDialog extends StatelessWidget {
  const FinishVisitDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Excluir endereço?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      content: const Text(
        'Você tem certeza que deseja excluir este endereço?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      actions: [
        Center(
          child: Wrap(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const HorizontalSpacerBox(size: SpacerSize.large),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'Excluir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
