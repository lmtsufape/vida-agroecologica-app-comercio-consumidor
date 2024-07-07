// ignore_for_file: file_names

import 'package:flutter/material.dart';

class VerticalSpacer extends StatelessWidget {
  final double size;
  const VerticalSpacer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
