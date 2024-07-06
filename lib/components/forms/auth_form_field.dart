import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

class AuthFormField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final Color backgroundColor;
  final TextEditingController? controller;
  final String? initialValue;

  const AuthFormField({
    super.key,
    required this.label,
    required this.isPassword,
    required this.inputType,
    this.onChanged,
    this.backgroundColor = kOnBackgroundColorText,
    this.controller,
    this.initialValue,
  });

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  late TextEditingController _controller;
  bool showPassword = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.06,
      child: TextFormField(
        controller: _controller,
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
                    color: kDetailColor,
                  ),
                )
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
              color: kDetailColor,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
