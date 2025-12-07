import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_styles.dart';
import '../core/constants/app_theme.dart';
import '../core/utils/app_responsiveness.dart';

class SimpleAppDrawer extends StatelessWidget {
  const SimpleAppDrawer({
    super.key,
    required this.options,
    required this.onTap,
    required this.selectedOption,
  });

  final List<String> options;
  final Function(String option) onTap;
  final String selectedOption;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.background(context),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.padding32,
          horizontal: AppSizes.padding20,
        ),
        itemCount: options.length,
        separatorBuilder: (context, index) =>
            SizedBox(height: AppSizes.padding16),
        itemBuilder: (ctx, index) {
          var item = options[index];
          final isSelected = selectedOption == item;

          return ElevatedButton(
            onPressed: () {
              onTap(item);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected
                  ? AppTheme.primary(ctx)
                  : AppTheme.background(ctx),
              foregroundColor: isSelected
                  ? AppTheme.whiteText(ctx)
                  : AppTheme.blackText(ctx),
              padding: EdgeInsets.all(AppSizes.padding16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius12),
              ),
              elevation: isSelected ? 4 : 0,
              shadowColor: isSelected
                  ? AppTheme.borderColor(ctx)
                  : AppColors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item,
                  style: isSelected
                      ? AppStyles.primaryStyle(
                          context: context,
                          color: AppColors.whiteText,
                          fontSize: AppResponsiveness.getSize(
                            onWeb: AppSizes.font20,
                            onMobile: AppSizes.font16,
                            onSmallMobile: AppSizes.font14,
                          ),
                          fontWeight: AppStyles.w600,
                        )
                      : AppStyles.secondaryStyle(
                          context: context,
                          fontSize: AppResponsiveness.getSize(
                            onWeb: AppSizes.font20,
                            onMobile: AppSizes.font16,
                            onSmallMobile: AppSizes.font14,
                          ),
                          fontWeight: AppStyles.w500,
                        ),
                ),
                if (isSelected)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: AppResponsiveness.adjustSize(AppSizes.size24),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
