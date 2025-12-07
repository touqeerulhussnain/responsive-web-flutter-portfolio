import 'package:flutter/material.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_colors.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_sizes.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_styles.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_theme.dart';
import 'package:open_source_flutter_portfolio/core/utils/app_responsiveness.dart';

class HorizontalButtonList extends StatelessWidget {
  const HorizontalButtonList({
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
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radius60),
        boxShadow: [
          BoxShadow(
            color: AppTheme.of(context).secondary.withOpacity(.6),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        border: Border.all(color: AppTheme.background(context)),
        color: AppTheme.background(context),
      ),
      child: ListView.separated(
        itemCount: options.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            SizedBox(width: AppSizes.padding12),
        itemBuilder: (ctx, index) {
          var item = options[index];
          return ElevatedButton(
            onPressed: () {
              onTap(item);
            },
            style: ElevatedButton.styleFrom(
              overlayColor: AppColors.transparent,
              // shadowColor: AppTheme.red(context),
              shadowColor: selectedOption == item
                  ? AppTheme.borderColor(context)
                  : AppColors.transparent,
              elevation: selectedOption == item ? 5 : 0,
              backgroundColor: selectedOption == item
                  ? AppTheme.primary(ctx)
                  : AppTheme.background(ctx),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radius60),
                // color: selectedOption == item
                //     ? AppColors.primary
                //     : AppColors.transparent,
              ),
              child: Text(
                item,
                style: selectedOption == item
                    ? AppStyles.primaryStyle(
                        context: context,
                        color: AppTheme.whiteText(context),
                        fontSize: AppResponsiveness.adjustSize(AppSizes.font20),
                        fontWeight: AppStyles.w500,
                      )
                    : AppStyles.secondaryStyle(
                        context: context,
                        color: AppTheme.blackText(context),
                        fontSize: AppResponsiveness.adjustSize(AppSizes.font20),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
