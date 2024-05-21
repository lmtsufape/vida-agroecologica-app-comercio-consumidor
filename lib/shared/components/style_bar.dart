import 'package:flutter/material.dart';

import '../constants/style_constants.dart';

class StyleBar extends StatelessWidget {
  final String title;
  final bool hasLeading;

  const StyleBar({super.key, required this.title, this.hasLeading = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: hasLeading,
      flexibleSpace: SizedBox(
        height: size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                style: kTitle1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: kDetailColor,
    );
  }
}
