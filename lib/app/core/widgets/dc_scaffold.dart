import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/core/theme/theme_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../main.dart';
import 'dc_menu_item.dart';

class DCScaffold extends StatefulWidget {
  final Widget title;
  final Widget body;
  final List<DCMenuItem> navBarItens;
  final List<DCMenuItem> drawerItens;
  final List<DCMenuItem> menuItens;
  final Widget? floatingActionButton;

  const DCScaffold({
    Key? key,
    this.title = const SizedBox.shrink(),
    this.navBarItens = const [],
    this.drawerItens = const [],
    this.menuItens = const [],
    this.body = const SizedBox.shrink(),
    this.floatingActionButton,
  }) : super(key: key);

  @override
  State<DCScaffold> createState() => _DCScaffoldState();
}

class _DCScaffoldState extends State<DCScaffold> {
  @override
  Widget build(BuildContext context) {
    bool enableDrawer = ResponsiveWrapper.of(context).isMobile;

    return Scaffold(
        appBar: AppBar(
          title: widget.title,
          leading: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          automaticallyImplyLeading: enableDrawer,
          actions: enableDrawer ? [] : _createMapNavBarItens(context),
        ),
        floatingActionButton:
            widget.floatingActionButton ?? widget.floatingActionButton,
        endDrawer: Visibility(
          visible: enableDrawer,
          child: Drawer(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.drawerItens.map((m) {
                    return _makeDrawItem(context, m);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.menuItens.isNotEmpty
                      ? SizedBox(
                          width: constraints.maxWidth,
                          height: 40,
                          child: MenuBar(
                            children: <Widget>[
                              ...widget.menuItens
                                  .map((m) => _makeMenuItem(context, m)),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    width: constraints.maxWidth,
                    height: widget.menuItens.isNotEmpty
                        ? (constraints.maxHeight - 40)
                        : constraints.maxHeight,
                    child: widget.body,
                  )
                ],
              );
            },
          ),
        )
        //        ),
//          widget.body
        //],
        //)
        );
  }

  List<Column> _createMapNavBarItens(BuildContext context) {
    List<Column> navs = widget.navBarItens.map((m) {
      return Column(
        children: [_makeNavBarItem(context, m)],
      );
    }).toList();

    navs.add(Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                injector<ThemeController>().changeTheme();
              });
            },
            icon: injector<ThemeController>().isLight.value
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          ),
        ),
      ],
    ));

    return navs;
  }

  Widget _makeMenuItem(BuildContext context, DCMenuItem m) {
    return m.subMenu == null
        ? MenuItemButton(
            leadingIcon: m.icon,
            onPressed: m.onPressed,
            child: MenuAcceleratorLabel('&${m.label}'),
          )
        : SubmenuButton(
            leadingIcon: m.icon,
            menuChildren: [
              ...m.subMenu!.map((e) => _makeMenuItem(context, e)).toList()
            ],
            child: MenuAcceleratorLabel('&${m.label}'),
          );
  }

  Widget _makeNavBarItem(BuildContext context, DCMenuItem m) {
    return DropdownButton(
      underline: const SizedBox.shrink(),
      // Initial Value
      hint: TextButton.icon(
        onPressed: m.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          textStyle: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        icon: m.icon,
        label: Text(m.label),
      ),

      iconSize: 0,
      // Array list of items
      items: m.subMenu?.map((item) {
        return DropdownMenuItem(
          value: item,
          onTap: item.onPressed,
          child: Text(item.label),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (value) {},
    );
  }

  Widget _makeDrawItem(BuildContext context, DCMenuItem m) {
    if (m.subMenu == null) {
      return ListTile(
        leading: m.icon,
        title: Text(m.label),
        onTap: m.onPressed,
      );
    } else {
      return ExpansionTile(
        leading: m.icon,
        title: Text(m.label),
        childrenPadding: const EdgeInsets.only(left: 20),
        children:
            m.subMenu!.map((item) => _makeDrawItem(context, item)).toList(),
      );
    }
  }
}
