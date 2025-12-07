import 'package:flutter/material.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_constant.dart';
import 'package:open_source_flutter_portfolio/widget/spaces.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/constants/app_styles.dart';
import '../core/constants/app_theme.dart';
import '../core/utils/app_responsiveness.dart';
import 'copy_button.dart';
import 'custom_svg.dart';

class LeftBubble extends StatelessWidget {
  const LeftBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.padding20,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: AppSizes.height56,
          width: AppSizes.height56,
          padding: EdgeInsets.all(AppSizes.padding10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.darkGrey,
            image: DecorationImage(
              image: AssetImage(AppAssets.profile),
              fit: BoxFit.cover,
            ),
          ),
        ),
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
                bottomRight: Radius.circular(AppSizes.radius24),
              ),
              color: AppColors.white,
            ),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: RichText(
                      maxLines: 3,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.youCanContactAt,
                            style: AppStyles.secondaryStyle(
                              context: context,
                              fontSize: AppResponsiveness.getSize(
                                onWeb: AppSizes.font24,
                                onTablet: AppSizes.font18,
                                onMobile: AppSizes.font16,
                                onSmallMobile: AppSizes.font14,
                              ),
                              fontWeight: AppStyles.w600,
                              color: AppColors.blackText,
                            ),
                          ),
                          TextSpan(
                            text: AppConstants.email,
                            style:
                                AppStyles.secondaryStyle(
                                  context: context,
                                  fontSize: AppResponsiveness.getSize(
                                    onWeb: AppSizes.font24,
                                    onTablet: AppSizes.font18,
                                    onMobile: AppSizes.font16,
                                  ),
                                  fontWeight: AppStyles.w600,
                                  color: AppColors.blackText,
                                ).copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.blackText,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SpaceW4(),
                  CopyButton(textToCopy: AppStrings.email),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
