import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

class AuthFormField2 extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextInputType inputType;
  final Function(String) onChanged;
  final Color backgroundColor;

  const AuthFormField2({
    super.key,
    required this.label,
    required this.isPassword,
    required this.inputType,
    required this.onChanged,
    this.backgroundColor = kOnBackgroundColorText,
  });

  @override
  State<AuthFormField2> createState() => _AuthFormField2State();
}

class _AuthFormField2State extends State<AuthFormField2> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.06,
      width: size.width * 0.20,
      child: TextFormField(
        onChanged: widget.onChanged,
        style: const TextStyle(color: kSecondaryColor),
        obscureText: widget.isPassword ? showPassword : false,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor,
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      color: kDetailColor))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, 
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color:
                  kDetailColor, 
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
