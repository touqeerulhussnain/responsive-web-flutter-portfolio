import 'package:flutter/material.dart';
import 'package:open_source_flutter_portfolio/core/utils/app_responsiveness.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/constants/app_styles.dart';
import '../core/constants/app_theme.dart';
import 'custom_svg.dart';

class RightBubble extends StatelessWidget {
  const RightBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.padding20,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.padding20,
              vertical: AppSizes.padding20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.radius24),
                topRight: Radius.circular(AppSizes.radius24),
                bottomLeft: Radius.circular(AppSizes.radius24),
              ),
              color: AppColors.darkGrey,
            ),
            child: Text(
              AppStrings.howCanIContactyou,
              style: AppStyles.secondaryStyle(
                context: context,
                fontSize: AppResponsiveness.getSize(
                  onWeb: AppSizes.font24,
                  onTablet: AppSizes.font18,
                  onMobile: AppSizes.font16,
                  onSmallMobile: AppSizes.font14,
                ),
                fontWeight: AppStyles.w500,
                color: AppTheme.whiteText(context),
              ),
            ),
          ),
        ),
        Container(
          height: AppSizes.height56,
          width: AppSizes.height56,
          padding: EdgeInsets.all(AppSizes.padding10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.darkGrey,
          ),
          child: CustomSvg(assetPath: AppAssets.person),
        ),
      ],
    );
  }
}
