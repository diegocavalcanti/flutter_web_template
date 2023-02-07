import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/modules/user/controller/user_controller.dart';
import 'package:flutter_web_template/app/modules/user/models/user_model.dart';
import 'package:get_it/get_it.dart';

import 'app/app_widget.dart';
import 'app/core/theme/theme_controller.dart';

GetIt injector = GetIt.instance;

void main() {
  //prod
  injector.registerSingleton<ThemeController>(ThemeController());
  injector.registerSingleton<UserController>(
      UserController(model: UserModel(email: "", name: "")));

  runApp(const AppWidget());
//   runApp(DevicePreview(
//       enabled: kDebugMode, builder: (context) => const AppWidget()));
}
