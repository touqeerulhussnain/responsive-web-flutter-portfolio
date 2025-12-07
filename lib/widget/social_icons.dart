import 'package:flutter/material.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_sizes.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_styles.dart';
import 'package:open_source_flutter_portfolio/core/utils/app_responsiveness.dart';
import 'package:open_source_flutter_portfolio/widget/custom_svg.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.assetPath,
    required this.text,
    required this.color,
    required this.onTap,
    this.height = AppSizes.height24,
    this.width = AppSizes.width24,
  });
  final String assetPath;
  final String text;
  final Color color;
  final double height;
  final double width;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      CustomSvg(
        assetPath: assetPath,
        height: height,
        width: width,
        color: color,
      ),
      Text(
        text,
        style: AppStyles.secondaryStyle(
          context: context,
          fontSize: AppResponsiveness.getSize(
            onWeb: AppSizes.font20,
            onMobile: AppSizes.font14,
            onTablet: AppSizes.font16,
            onSmallMobile: AppSizes.font12,
          ),
          color: color,
        ),
      ),
    ];
    return TextButton(
      onPressed: onTap,
      child: AppResponsiveness.getDynamic(
        onWeb: Row(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: widgets,
        ),
        onMobile: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: widgets,
        ),
        smallMobile: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: widgets,
        ),
      ),
    );
  }
}
