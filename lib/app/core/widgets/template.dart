import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/core/widgets/menu_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../style.dart';

class Template extends StatelessWidget {
  final Widget title;
  final List<MenuItem> menuItens;

  final Widget body;

  const Template({
    Key? key,
    this.title = const SizedBox.shrink(),
    this.menuItens = const [],
    this.body = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool enableDrawer = ResponsiveWrapper.of(context).isMobile;

    return Scaffold(
      // backgroundColor: appBarBackgroundColor,
      appBar: AppBar(
        title: title,
        leading: const FlutterLogo(),
        actions: enableDrawer
            ? []
            : menuItens
                .map(
                  (m) => TextButton.icon(
                    onPressed: m.onPressed,
                    style: menuButtonStyle,
                    icon: m.icon!,
                    label: Text(m.label!),
                  ),
                )
                .toList(),
        automaticallyImplyLeading: enableDrawer,
      ),
      endDrawer: Visibility(
        visible: enableDrawer,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountEmail: Text("user@mail.com"),
                accountName: Text("User Name"),
                currentAccountPicture: CircleAvatar(
                  child: Text("IC"),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Wrap(
                    children: menuItens
                        .map(
                          (m) => ListTile(
                              leading: m.icon,
                              title: Text(m.label!),
                              onTap: m.onPressed),
                        )
                        .toList()),
              ),
            ],
          ),
        ),
      ),
      body: body,
    );
  }
}
