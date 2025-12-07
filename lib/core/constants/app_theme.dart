import 'package:flutter/material.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_sizes.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_styles.dart';
import '/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData ligthTheme = ThemeData(
    colorScheme: colorScheme,
    textTheme: _textTheme,
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: darkcolorScheme,

    // scaffoldBackgroundColor: AppColors.black,
    textTheme: _textTheme,
  );

  static final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    // primary: AppColors.primary,
    surface: AppColors.backgroundColor,
  );
  static final ColorScheme darkcolorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    // primary: AppColors.primary,
    surface: AppColors.backgroundColor,
    // brightness: Brightness.dark,
  );

  static final TextTheme _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: AppSizes.font64,
      fontWeight: AppStyles.w500,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      fontSize: AppSizes.font32,
      color: AppColors.blackText,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      fontSize: AppSizes.font32,
      color: AppColors.blackText,
      fontStyle: FontStyle.normal,
    ),
  );
  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
  static Color background(BuildContext context) =>
      Theme.of(context).colorScheme.surface;
  static Color borderColor(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;
  static List<Shadow> textShadow(BuildContext context) => [
    Shadow(color: Theme.of(context).colorScheme.secondary),
  ];
  static Color? primaryText(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
  static Color? blackText(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge?.color;
  static Color? blackEirie(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge?.color?.withOpacity(.8);
  static Color? whiteText(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimary;
  static Color? red(BuildContext context) => Colors.red;

  static ColorScheme of(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static TextTheme ofText(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}

///Old Code
// class AppTheme {
//   AppTheme._();

//   static ThemeData ligthTheme = ThemeData(
//     colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
//     scaffoldBackgroundColor: AppColors.backgroundColor,
//     progressIndicatorTheme: ProgressIndicatorThemeData(
//       color: AppColors.black,
//       refreshBackgroundColor: AppColors.white,
//     ),
//     textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.black),
//     appBarTheme: AppBarTheme(
//       color: AppColors.backgroundColor,
//       surfaceTintColor: AppColors.transparent,
//       scrolledUnderElevation: 0,
//       iconTheme: IconThemeData(),
//     ),
//     textTheme: _textTheme,
//   );

//   static final ColorScheme colorScheme = ColorScheme.fromSeed(
//     seedColor: AppColors.primary,
//     surface: AppColors.backgroundColor,
//   );
//   static final TextTheme _textTheme = TextTheme(
//     // displayLarge: TextStyle(
//     //   fontSize: AppSizes.font64,
//     //   color: AppColors.black,
//     //   fontWeight: AppStyles.w500,
//     //   fontStyle: FontStyle.normal,
//     // ),
//     // displayMedium: TextStyle(
//     //   fontSize: AppSizes.TEXT_SIZE_60,
//     //   color: AppColors.black,
//     //   fontWeight: _bold,
//     //   fontStyle: FontStyle.normal,
//     // ),
//     // displaySmall: TextStyle(
//     //   fontSize: AppSizes.TEXT_SIZE_48,
//     //   color: AppColors.black,
//     //   fontWeight: _bold,
//     //   fontStyle: FontStyle.normal,
//     // ),
//     // headlineMedium: TextStyle(
//     //   fontSize: AppSizes.TEXT_SIZE_34,
//     //   color: AppColors.black,
//     //   fontWeight: _bold,
//     //   fontStyle: FontStyle.normal,
//     // ),
//     // headlineSmall: TextStyle(
//     //   fontSize: AppSizes.TEXT_SIZE_24,
//     //   color: AppColors.black,
//     //   fontWeight: _bold,
//     //   fontStyle: FontStyle.normal,
//     // ),
//     titleLarge: TextStyle(
//       fontSize: AppSizes.font64,
//       color: AppColors.primaryText,
//       fontWeight: AppStyles.w500,
//       fontStyle: FontStyle.normal,
//     ),
//     titleMedium: TextStyle(
//       fontSize: AppSizes.font32,
//       color: AppColors.blackText,
//       fontStyle: FontStyle.normal,
//     ),
//     // titleSmall: TextStyle(
//     //   fontSize: AppSizes.TEXT_SIZE_14,
//     //   color: AppColors.black,
//     //   fontWeight: _bold,
//     //   fontStyle: FontStyle.normal,
//     // ),
//     bodyLarge: TextStyle(
//       fontSize: AppSizes.font32,
//       color: AppColors.blackText,
//       fontWeight: AppStyles.w500,
//       fontStyle: FontStyle.normal,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: AppSizes.font32,
//       color: AppColors.blackText,
//       fontStyle: FontStyle.normal,
//     ),
//     bodySmall: TextStyle(
//       fontSize: AppSizes.font24,
//       color: AppColors.blackText,
//       fontStyle: FontStyle.normal,
//     ),
//     labelLarge: TextStyle(
//       fontSize: AppSizes.font24,
//       color: AppColors.primaryText,
//       fontStyle: FontStyle.normal,
//     ),

//     labelMedium: TextStyle(
//       fontSize: AppSizes.font20,
//       color: AppColors.whiteText,
//       fontStyle: FontStyle.normal,
//     ),
//     labelSmall: TextStyle(
//       fontSize: AppSizes.font12,
//       color: AppColors.whiteText,
//       fontStyle: FontStyle.normal,
//     ),
//   );

//   static ColorScheme of(BuildContext context) {
//     return Theme.of(context).colorScheme;
//   }

//   static TextTheme ofText(BuildContext context) {
//     return Theme.of(context).textTheme;
//   }
// }
