import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_theme.dart';
import 'package:open_source_flutter_portfolio/core/utils/app_responsiveness.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/constants/firebase_options.dart';
import 'core/utils/dprint.dart';
import 'view/home_view/home_view.dart';

void main() async {
  try {
    await Firebase.initializeApp(options: options());
    dprint('Firebase initialized');
  } catch (e) {
    // Handle Firebase initialization error
    dprint('Firebase initialization error: $e');
  }
  runApp(
    DevicePreview(
      enabled: false,
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
