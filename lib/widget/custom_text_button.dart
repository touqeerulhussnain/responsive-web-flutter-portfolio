import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding = EdgeInsets.zero,
  });
  final Function() onPressed;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius16),
          side: BorderSide(
            color: AppColors.borderColor,
            width: AppSizes.border1,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
