import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/core/widgets/dc_menu_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/widgets/dc_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DCScaffold(
      title: const Text('Title App'),
      body: _body(context),
      menuItens: _menuItens(),
      drawerItens: _menuItens(),
      navBarItens: _menuItens(),
    );
  }

  List<DCMenuItem> _menuItens() {
    return [
      DCMenuItem(
        label: 'Home',
        icon: const Icon(Icons.home_outlined),
        onPressed: () => debugPrint('clicou..'),
      ),
      DCMenuItem(
          label: 'Portifólio',
          icon: const Icon(Icons.apps_outlined),
          onPressed: () => debugPrint('clicou..'),
          subMenu: [
            DCMenuItem(
              label: 'Sobre',
              icon: const Icon(Icons.info_outline),
              onPressed: () => debugPrint('clicou..'),
            ),
            DCMenuItem(
                label: 'Contato',
                icon: const Icon(Icons.contact_mail_outlined),
                onPressed: () => debugPrint('clicou..'),
                subMenu: [
                  DCMenuItem(
                    label: 'Sobre',
                    icon: const Icon(Icons.info_outline),
                    onPressed: () => debugPrint('clicou..'),
                  ),
                ]),
          ]),
      DCMenuItem(
        label: 'Perfil',
        icon: const Icon(Icons.person),
        onPressed: () => debugPrint('clicou..'),
      ),
    ];
  }
}

_body(BuildContext context) {
  return Container(
    color: Colors.blue,
    height: ResponsiveWrapper.of(context).screenHeight,
    //  width: ResponsiveWrapper.of(context).screenWidth,
  );
}


  // ResponsiveRowColumn _body(BuildContext context) {
  //   return ResponsiveRowColumn(
  //     // rowPadding: const EdgeInsets.all(10),
  //     // columnPadding: const EdgeInsets.all(10),
  //     layout: ResponsiveWrapper.of(context).isMobile
  //         ? ResponsiveRowColumnType.ROW
  //         : ResponsiveRowColumnType.COLUMN,
  //     children: [
  //       ResponsiveRowColumnItem(
  //         rowFlex: 1,
  //         columnFlex: 1,
  //         child: _containerVermelho(context),
  //       ),
  //       ResponsiveRowColumnItem(
  //         rowFlex: 1,
  //         columnFlex: 1,
  //         child: _containerAzul(context),
  //       ),
  //     ],
  //   );
  // }

