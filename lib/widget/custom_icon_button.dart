import 'package:flutter/material.dart';
import '/widget/custom_svg.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.assetPath,
    this.padding = EdgeInsets.zero,
  });
  final Function() onPressed;
  final String assetPath;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius16),
          side: BorderSide(color: AppColors.white, width: AppSizes.border1),
        ),
      ),
      onPressed: onPressed,
      child: CustomSvg(assetPath: assetPath),
    );
  }
}
