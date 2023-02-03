import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/core/controller/theme_controller.dart';
import 'package:flutter_web_template/app/core/theme/theme_app.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../main.dart';
import 'core/routes.dart';
import 'modules/home/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: locator<ThemeController>().isDark,
      builder: (context, value, child) => MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 360,
          defaultScale: true,
          background:
              Container(color: const Color.fromARGB(255, 197, 197, 197)),
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
        initialRoute: Routes.home,
        onGenerateRoute: (RouteSettings settings) {
          return Routes.fadeThrough(settings, (context) {
            switch (settings.name) {
              case Routes.home:
                return const HomePage();
              default:
                return const SizedBox.shrink();
            }
          });
        },
        debugShowCheckedModeBanner: false,
        theme: themeData(locator<ThemeController>().isDark.value),
      ),
    );
  }
}
