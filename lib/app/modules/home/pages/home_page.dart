import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/core/widgets/menu_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/widgets/template.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
      title: const Text('Title App'),
      body: _body(context),
      menuItens: _menuItens(),

    );
  }

  ResponsiveRowColumn _body(BuildContext context) {
    return ResponsiveRowColumn(
      // rowPadding: const EdgeInsets.all(10),
      // columnPadding: const EdgeInsets.all(10),
      layout: ResponsiveWrapper.of(context).isMobile
          ? ResponsiveRowColumnType.ROW
          : ResponsiveRowColumnType.COLUMN,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          columnFlex: 1,
          child: _containerVermelho(context),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          columnFlex: 1,
          child: _containerAzul(context),
        ),
      ],
    );
  }

  List<MenuItem> _menuItens() {
    return [
      MenuItem(
        label: 'Home',
        icon: const Icon(Icons.home_outlined),
        onPressed: () => debugPrint('clicou..'),
      ),
      MenuItem(
        label: 'Portifólio',
        icon: const Icon(Icons.apps_outlined),
        onPressed: () => debugPrint('clicou..'),
      ),
      MenuItem(
        label: 'Sobre',
        icon: const Icon(Icons.info_outline),
        onPressed: () => debugPrint('clicou..'),
      ),
      MenuItem(
        label: 'Contato',
        icon: const Icon(Icons.contact_mail_outlined),
        onPressed: () => debugPrint('clicou..'),
      ),
      MenuItem(
        label: 'Perfil',
        icon: const Icon(Icons.person),
        onPressed: () => debugPrint('clicou..'),
      ),
    ];
  }
}

_containerAzul(BuildContext context) {
  return Container(
    color: Colors.blue,
    height: ResponsiveWrapper.of(context).screenHeight,
    //  width: ResponsiveWrapper.of(context).screenWidth,
  );
}

_containerVermelho(BuildContext context) {
  return Container(
    color: Colors.red,
    height: ResponsiveWrapper.of(context).screenHeight,
    //width: ResponsiveWrapper.of(context).screenWidth,
    // height: 200,
    // width: 200,
  );
}
