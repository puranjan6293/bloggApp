// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  });

  double height;
  Style? styleType;
  double? leadingWidth;
  Widget? leading;
  Widget? title;
  bool? centerTitle;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  Widget? _getStyle() {
    switch (styleType) {
      case Style.bgShadowBlack90021:
        return Container(
          height: 50.0, // Replace with the desired height
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white, // Replace with the desired color
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.21), // Replace with the desired shadow color
                spreadRadius: 2.0,
                blurRadius: 2.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgShadowBlack90021,
}
