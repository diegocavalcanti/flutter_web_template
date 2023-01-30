import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Template extends StatelessWidget {
  final bool enableDrawer;
  final Widget title;
  final List<Widget> actionsTopRight;
  final List<Widget> actionsLeftDrawer;
  final Widget body;

  const Template(
      {Key? key,
      this.title = const SizedBox.shrink(),
      this.actionsTopRight = const [],
      this.actionsLeftDrawer = const [],
      this.body = const SizedBox.shrink(),
      this.enableDrawer = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: actionsTopRight, title: title,
        // leading: SizedBox.shrink(),
      ),
      drawer: Visibility(
        visible: true,
        child: Drawer(
          elevation: 10,
          child: ListView(
            padding: EdgeInsets.zero,
            children: actionsLeftDrawer,
          ),
        ),
      ),
      body: body,
    );
  }
}
