import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app_widget.dart';
import 'app/core/controller/theme_controller.dart';

GetIt locator = GetIt.instance;

void main() {
  //prod

  locator.registerSingleton<ThemeController>(ThemeController());

  runApp(const AppWidget());
//   runApp(DevicePreview(
//       enabled: kDebugMode, builder: (context) => const AppWidget()));
}
