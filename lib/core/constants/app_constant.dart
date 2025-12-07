// ignore_for_file: non_constant_identifier_names

// import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/core/utils/dprint.dart';

class AppConstants {
  AppConstants._internal();

  static final AppConstants instance = AppConstants._internal();
  factory AppConstants() => instance;

  static const String linkedInUrl =
      "https://www.linkedin.com/in/touqeerulhussnain/";
  static const String facebookUrl =
      "https://www.facebook.com/touqeerulhussnain";
  static const String instagramUrl =
      "https://www.instagram.com/touqeerulhussnainraza/";
  static const String resumePdfUrl =
      "https://drive.google.com/file/d/YOUR_PDF_ID/view?usp=sharing";

  static String email = "touqeerulhussnain@gmail.com";
}
