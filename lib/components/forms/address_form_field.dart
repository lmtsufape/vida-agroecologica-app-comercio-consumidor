import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';

class AddressFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextInputFormatter? maskFormatter;
  final bool enabled;
  final Function? validateForm;

  const AddressFormField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.maskFormatter,
    this.enabled = true,
    this.validateForm,
    this.maxLength,
  });

  @override
  State<AddressFormField> createState() => _AddressFormFieldState();
}

class _AddressFormFieldState extends State<AddressFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(0, 0, 0, 0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(0, 255, 255, 255),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(0, 0, 0, 0),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(color: kErrorColor),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorStyle: const TextStyle(
          color: kErrorColor,
          backgroundColor: Colors.white,
        ),
        filled: true,
        fillColor: kButtomBackgroundColor,
        contentPadding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
      ),
      inputFormatters: widget.maskFormatter != null
          ? [
              widget.maskFormatter!,
            ]
          : [],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => widget.validateForm!(value),
      enabled: widget.enabled,
    );
  }
}
