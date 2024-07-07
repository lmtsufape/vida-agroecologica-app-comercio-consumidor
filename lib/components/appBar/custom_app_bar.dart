import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import necessário para SystemUiOverlayStyle
import 'package:ecommerceassim/shared/constants/style_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    Key? key,
    this.automaticallyImplyLeading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: const Text(
        "APP-ASSIM",
        style: TextStyle(
          fontSize: 18,
          color: kDetailColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: kDetailColor),
      backgroundColor: kOnSurfaceColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
