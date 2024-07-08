import 'package:vidaagroconsumidor/assets/index.dart';
import 'package:vidaagroconsumidor/components/utils/vertical_spacer_box.dart';
import 'package:vidaagroconsumidor/shared/constants/app_enums.dart';
import 'package:vidaagroconsumidor/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

class HeaderStartApp extends StatelessWidget {
  final Color textColor;
  const HeaderStartApp( this.textColor,{super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            Assets.logoVidaAgro,
            width: 160,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Column(
          children: [
            Text(
              'VIDA AGROECOLÓGICA',
              textAlign: TextAlign.center,
              style: kTitle1.copyWith(
                  color: textColor,
                  fontSize: size.height * 0.030),
            ),
            Text(
              '(aplicativo consumidor/a)',
              textAlign: TextAlign.center,
              style: kTitle1.copyWith(
                  color: textColor,
                  fontSize: size.height * 0.019),
            ),
          ],
        ),
        const VerticalSpacerBox(size: SpacerSize.huge),
      ],
    );
  }
}
