// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPicRenderer extends StatelessWidget {
  const SvgPicRenderer(
      {super.key, required this.filePath, required this.color});
  final String filePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      filePath,
      color: color,
    );
  }
}
