import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_template/app/core/routes/router_config.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_web_template/app/core/theme/theme_controller.dart';
import 'package:flutter_web_template/app/core/theme/theme_app.dart';
import '../main.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: injector<ThemeController>().isLight,
      builder: (context, value, child) {
        return MaterialApp.router(
          routerConfig: routerConfig,
          supportedLocales: const [Locale('pt', 'BR')],
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
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
          debugShowCheckedModeBanner: false,
          theme: themeData(injector<ThemeController>().isLight.value),
        );
      },
    );
  }
}
