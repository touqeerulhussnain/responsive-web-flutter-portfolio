import 'package:flutter/material.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_sizes.dart';
import '/core/constants/app_styles.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/app_responsiveness.dart';
import '/widget/custom_svg.dart';
import '/widget/dotted_border_widget.dart';
import '/widget/animation/pulse_float_motion.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.assetPath,
    required this.title,
    required this.description,
    this.height = AppSizes.height130,
    this.width = AppSizes.width130,
    required this.bullets,
  });
  final String assetPath;
  final String title;
  final String description;
  final List<String> bullets;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          // height: 400,
          width: AppResponsiveness.setWidth(
            context,
            width: AppResponsiveness.getSize(
              onWeb: AppSizes.fraction8,
              onMobile: AppSizes.fraction9,
              onSmallMobile: AppSizes.fraction9,
            ),
          ),

          decoration: BoxDecoration(
            color: AppTheme.background(context),
            borderRadius: BorderRadius.circular(AppSizes.radius20),
            border: DottedBorder.all(color: AppTheme.borderColor(context)),
          ),
          padding: EdgeInsets.only(
            left: AppSizes.padding32,
            right: AppSizes.padding32,
            top: AppSizes.padding32,
            bottom: AppSizes.padding32,
          ),
          child: Row(
            spacing: AppSizes.padding10,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  // color: AppColors.red,
                  child: Column(
                    spacing: AppSizes.padding20,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyles.primaryStyle(
                          context: context,
                          color: AppTheme.blackText(context),
                          fontSize: AppResponsiveness.getSize(
                            onWeb: AppSizes.font24,
                            onMobile: AppSizes.font20,
                            onTablet: AppSizes.font20,
                          ),
                        ),
                      ),
                      Text(
                        description,
                        style: AppStyles.secondaryStyle(
                          context: context,
                          color: AppTheme.blackText(context),
                          fontSize: AppResponsiveness.getSize(
                            onWeb: AppSizes.font20,
                            onMobile: AppSizes.font16,
                            onTablet: AppSizes.font16,
                          ),
                        ),
                      ),

                      ...List.generate(bullets.length, (i) {
                        return Row(
                          spacing: AppSizes.padding16,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: AppSizes.height12,
                              width: AppSizes.width12,
                              margin: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.primaryText(context),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                bullets[i],
                                style: AppStyles.secondaryStyle(
                                  context: context,
                                  fontSize: AppResponsiveness.getSize(
                                    onWeb: AppSizes.font20,
                                    onMobile: AppSizes.font16,
                                    onTablet: AppSizes.font16,
                                  ),
                                  color: AppTheme.blackText(context),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: PulseFloatIcon(
                  repeat: false,
                  count: 2,
                  icon: CustomSvg(
                    assetPath: assetPath,
                    // height: null,
                    color: AppTheme.primary(context),
                    height: AppResponsiveness.getSize(
                      onWeb: AppSizes.size200,
                      onMobile: AppSizes.size100,
                      onTablet: AppSizes.size150,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
