import 'package:flutter/material.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_assets.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_theme.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

class AppStyles {
  AppStyles._();
  static final AppStyles _instance = AppStyles._();
  factory AppStyles() => _instance;

  static double ipadProSize = 8;
  static double ipadSize = 3;
  static double miniSize = -2;

  static const FontWeight w300 = FontWeight.w300;
  static const FontWeight w400 = FontWeight.w400;
  static const FontWeight w500 = FontWeight.w500;
  static const FontWeight w600 = FontWeight.w600;
  static const FontWeight w700 = FontWeight.w700;
  static const FontWeight w800 = FontWeight.w800;

  // static double getRelativeSize(double currentSize, {bool? ignore}) {
  //   if (ignore != null && ignore == true) return currentSize;
  //   if (AppResponsiveness.isIPadMiniSize()) return ipadSize + currentSize;
  //   if (AppResponsiveness.isIPadProSize()) return ipadProSize + currentSize;
  //   if (AppResponsiveness.isiPhoneMiniSize()) return miniSize + currentSize;
  //   return currentSize;
  // }

  static double getRelativeSizeTwo(
    double currentSize, {
    bool? ignore,
    required BuildContext? context,
  }) {
    if (context == null) {
      return currentSize;
    }
    if (ignore != null && ignore == true) return currentSize;

    final width = MediaQuery.of(context).size.width;
    double scaleFactor = 1.0;

    if (width < 400) {
      scaleFactor = 0.9;
    } else if (width < 600) {
      scaleFactor = 1.0;
    } else if (width <= 745) {
      scaleFactor = 1.1;
    } else {
      scaleFactor = 1.2;
    }

    return currentSize * scaleFactor;
  }

  static TextStyle primaryStyle({
    Color? color,
    double fontSize = AppSizes.font18,
    FontWeight? fontWeight = w700,
    double? letterSpacing = 0.0,
    required BuildContext context,
    List<Shadow> shadows = const [],
  }) {
    return TextStyle(
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      shadows: shadows,
      color: color ?? AppTheme.primaryText(context),
      fontFamily: AppAssets.plusJakartaSans,
    );
  }

  static TextStyle secondaryStyle({
    double fontSize = AppSizes.font14,
    Color? color,
    FontWeight? fontWeight = w400,
    required BuildContext context,
    double? letterSpacing = 0.0,
    List<Shadow> shadows = const [],
  }) {
    return TextStyle(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppTheme.primaryText(context),
      fontFamily: AppAssets.plusJakartaSans,
    );
  }
}
