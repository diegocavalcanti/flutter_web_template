// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class MenuItem {
  final String? label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final List<MenuItem>? subMenu;

  const MenuItem({this.label, this.icon, this.onPressed, this.subMenu});
}
