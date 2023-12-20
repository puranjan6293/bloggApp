//button widget that take text and function
import 'package:flutter/material.dart';

import '../../../constants/app_text_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: (MediaQuery.of(context).size.width / 3) - 10,
        height: 50,
        decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 75, 219, 161),
          color: Color.fromARGB(255, 69, 162, 238),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextThemes.button,
          ),
        ),
      ),
    );
  }
}
