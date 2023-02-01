import 'package:flutter/material.dart';

class DCMenuItem {
  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final List<DCMenuItem>? subMenu;

  const DCMenuItem({
    this.label = '',
    this.icon = const Icon(Icons.arrow_outward),
    this.onPressed,
    this.subMenu,
  });
}
