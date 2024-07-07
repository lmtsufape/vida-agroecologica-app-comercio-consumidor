import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomInkWell({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: const BoxDecoration(
                color: kOnSurfaceColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 32,
                      color: kDetailColor,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: kTextColorBlack),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
