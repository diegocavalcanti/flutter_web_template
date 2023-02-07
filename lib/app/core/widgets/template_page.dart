import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/core/widgets/dc_menu_item.dart';
import 'package:go_router/go_router.dart';

import 'dc_scaffold.dart';

class TemplatePage extends StatelessWidget {
  final Widget? floatingActionButton;
  final Widget body;
  const TemplatePage({
    super.key,
    this.floatingActionButton,
    this.body = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return DCScaffold(
      title: const Text('Title App'),
      body: body,
      menuItens: _menuItens(context),
      drawerItens: _menuItens(context),
      navBarItens: _menuItens(context),
      floatingActionButton: floatingActionButton ?? floatingActionButton,
    );
  }

  List<DCMenuItem> _menuItens(BuildContext context) {
    return [
      DCMenuItem(
        label: 'Home',
        icon: const Icon(Icons.home_outlined),
        onPressed: () => context.go('/home'),
      ),
      DCMenuItem(
        label: 'Users',
        icon: const Icon(Icons.person),
        onPressed: () => context.go("/user"),
      ),
      DCMenuItem(
          label: 'About US',
          icon: const Icon(Icons.apps_outlined),
          onPressed: () => debugPrint('click action About US..'),
          subMenu: [
            DCMenuItem(
              label: 'Email',
              icon: const Icon(Icons.info_outline),
              onPressed: () => debugPrint('click action Email..'),
            ),
            DCMenuItem(
                label: 'Contact',
                icon: const Icon(Icons.contact_mail_outlined),
                onPressed: () => debugPrint('click action Contact..'),
                subMenu: [
                  DCMenuItem(
                    label: 'Sobre',
                    icon: const Icon(Icons.info_outline),
                    onPressed: () => debugPrint('clicou..'),
                  ),
                ]),
          ]),
    ];
  }
}
