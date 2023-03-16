import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {

  final IconData icon;
  final IconData selecIcon;
  final String? title;

  const NavigationBarCustom({Key? key, required this.icon, required this.selecIcon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
        icon: Icon(icon),
        selectedIcon: Icon(selecIcon),
        label: '$title');
  }
}