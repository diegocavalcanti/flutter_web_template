import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';

void main() {
  //prod
  runApp(const AppWidget());
//   runApp(DevicePreview(
//       enabled: kDebugMode, builder: (context) => const AppWidget()));
}
