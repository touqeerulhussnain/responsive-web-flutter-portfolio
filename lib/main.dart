import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_theme.dart';
import 'package:open_source_flutter_portfolio/core/utils/app_responsiveness.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/constants/firebase_options.dart';
import 'core/utils/dprint.dart';
import 'view/home_view/home_view.dart';
// Import the functions you need from the SDKs you need
// import { initializeApp } from "firebase/app";
// // TODO: Add SDKs for Firebase products that you want to use
// // https://firebase.google.com/docs/web/setup#available-libraries

// // Your web app's Firebase configuration
// const firebaseConfig = {
//   apiKey: "AIzaSyBO2YlENtUBYA7Tl8U7H3oyUpYKQFBiLUQ",
//   authDomain: "responsive-flutter-portfolio.firebaseapp.com",
//   projectId: "responsive-flutter-portfolio",
//   storageBucket: "responsive-flutter-portfolio.firebasestorage.app",
//   messagingSenderId: "780548286752",
//   appId: "1:780548286752:web:607f2bc7dcd79e05a80f45"
// };

// // Initialize Firebase
// const app = initializeApp(firebaseConfig);
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
