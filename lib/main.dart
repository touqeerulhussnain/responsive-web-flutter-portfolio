import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_theme.dart';
import 'package:open_source_flutter_portfolio/core/utils/app_responsiveness.dart';

import 'view/home_view/home_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsiveness.initialize(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligthTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: HomeView(),
    );
  }
}
