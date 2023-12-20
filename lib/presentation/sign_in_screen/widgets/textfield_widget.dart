//text field widget
import 'package:flutter/material.dart';

import '../../../constants/app_text_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final String label;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.name,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: name,
        labelText: label,
        floatingLabelStyle: const TextStyle(
          color: Color.fromARGB(255, 69, 162, 238),
        ),
        labelStyle: AppTextThemes.caption,
        hintStyle: AppTextThemes.caption,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 69, 162, 238),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
