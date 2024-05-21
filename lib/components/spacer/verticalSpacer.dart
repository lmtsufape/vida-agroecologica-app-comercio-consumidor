// ignore: file_names
import 'package:flutter/material.dart';

class VerticalSpacer extends StatelessWidget {
  final double size;
  const VerticalSpacer({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
