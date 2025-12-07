// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dprint.dart';

class AppResponsiveness {
  AppResponsiveness._internal();
  static final AppResponsiveness _instance = AppResponsiveness._internal();
  factory AppResponsiveness() => _instance;

  /// Device type flags
  static bool isMobile = false;
  static bool isWeb = false;
  static bool isTablet = false;
  static bool isSmallMobile = false;

  /// Size adjustments for scaling
  static double tabletScale = 0;
  static double normalMobileScale = -5;
  static double smallMobileScale = -10;

  /// Breakpoints (IMPROVED FOR WEB)
  static const double SMALL_MOBILE_MAX = 360;
  static const double MOBILE_MAX = 600;
  static const double TABLET_MAX = 1024;
  static const double WEB_MIN = 1025;

  static double setWidth(BuildContext context, {double width = 1}) {
    return MediaQuery.of(context).size.width * width;
  }

  static double setHeight(BuildContext context, {double height = 1}) {
    return MediaQuery.of(context).size.height * height;
  }

  static void initialize(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width <= SMALL_MOBILE_MAX) {
      // Small phones
      isSmallMobile = true;
      isMobile = false;
      isTablet = false;
      isWeb = false;
      dprint("width:$width, device = SMALL_MOBILE_MAX ");
    } else if (width <= MOBILE_MAX) {
      // Regular phones
      isSmallMobile = false;
      isMobile = true;
      isTablet = false;
      isWeb = false;
      dprint("width:$width, device = MOBILE_MAX ");
    } else if (width <= TABLET_MAX) {
      // Tablets / iPads
      isSmallMobile = false;
      isMobile = false;
      isTablet = true;
      isWeb = false;
      dprint("width:$width, device = TABLET_MAX ");
    } else {
      // Desktop / Web
      isSmallMobile = false;
      isMobile = false;
      isTablet = false;
      isWeb = true;
      dprint("width:$width, device = WEB ");
    }
  }

  static bool isMobileSize() => isMobile;
  static bool isSmallMobileSize() => isSmallMobile;
  static bool isTabletSize() => isTablet;

  // ---------- SIZE ADJUSTMENT ----------
  static double adjustSize(double currentSize) {
    if (isSmallMobileSize()) return currentSize + smallMobileScale;
    if (isMobileSize()) return currentSize + normalMobileScale;
    if (isTabletSize()) return currentSize + tabletScale;
    return currentSize;
  }

  // ---------- GET SIZE VARIANT ----------
  static double getSize({
    required double onWeb,
    double? onTablet,
    double? onSmallMobile,
    double? onMobile,
  }) {
    if (isTablet && onTablet != null) return onTablet;
    if (isMobile && onMobile != null) return onMobile;
    if (isSmallMobile && onSmallMobile != null) return onSmallMobile;
    if (isSmallMobile && onMobile != null) return onMobile;
    return onWeb;
  }

  static dynamic getDynamic({
    required dynamic onWeb,
    dynamic onTablet,
    dynamic smallMobile,
    dynamic onMobile,
  }) {
    if (isTablet && onTablet != null) return onTablet;
    if (isMobile && onMobile != null) return onMobile;
    if (isSmallMobile && smallMobile != null) return smallMobile;
    return onWeb;
  }

  // ---------- DYNAMIC SPACING ----------
  static double getDynamicSpace(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width <= TABLET_MAX) {
      dprint("Tablet spacing: ${width * .1}");
      return width * .1;
    }

    // Web
    dprint("Web spacing: ${width * .18}");
    return width * .18;
  }

  static EdgeInsets getPadding({
    required EdgeInsets normal,
    EdgeInsets? iPadPro,
    EdgeInsets? mini,
    EdgeInsets? iPadMini,
  }) {
    if (isTablet && iPadPro != null) return iPadPro;
    if (isSmallMobile && mini != null) return mini;
    if (isMobile && iPadMini != null) return iPadMini;
    return normal;
  }
}
