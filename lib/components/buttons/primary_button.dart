import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.color, 
    this.borderColor = const Color.fromARGB(0, 255, 255, 255),
    this.textColor = Colors.white
  });

  final String text;
  final Color textColor;
  final VoidCallback? onPressed;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
          
            side: BorderSide(color: borderColor, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
