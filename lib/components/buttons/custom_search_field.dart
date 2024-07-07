import 'package:ecommerceassim/components/buttons/debouncer.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final Color fillColor;
  final Color iconColor;
  final String hintText;
  final EdgeInsets padding;
  final double borderRadius;
  final Function(String) onSearch;
  final Function(bool) setLoading;

  CustomSearchField({
    super.key,
    required this.fillColor,
    required this.iconColor,
    required this.hintText,
    required this.padding,
    this.borderRadius = 10.0,
    required this.onSearch,
    required this.setLoading,
  });

  final Debouncer debouncer = Debouncer(milliseconds: 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        onChanged: (text) {
          setLoading(true);
          debouncer.call(() {
            onSearch(text);
            setLoading(false);
          });
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          isDense: true,
          prefixIcon: Icon(Icons.search, color: iconColor, size: 25),
        ),
      ),
    );
  }
}
