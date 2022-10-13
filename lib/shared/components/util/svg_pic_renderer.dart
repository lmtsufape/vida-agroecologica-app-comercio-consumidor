import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPicRenderer extends StatelessWidget {
  const SvgPicRenderer({Key? key, required this.filePath, required this.color})
      : super(key: key);
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
