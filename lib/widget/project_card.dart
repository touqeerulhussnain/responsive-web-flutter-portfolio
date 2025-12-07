import 'package:flutter/material.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_assets.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_sizes.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_styles.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_theme.dart';
import 'package:open_source_flutter_portfolio/core/utils/app_responsiveness.dart';
import 'package:open_source_flutter_portfolio/widget/custom_svg.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.assetPath,
    required this.title,
    required this.description,
    this.onPlayStoreTap,
    this.onAppStoreTap,
    required this.uniqueColor,
    this.height = AppSizes.height130,
    this.width = AppSizes.width130,
    required this.lableText,
  });
  final String assetPath;
  final String title;
  final String lableText;
  final String description;
  final Function()? onPlayStoreTap;
  final Function()? onAppStoreTap;
  final Color uniqueColor;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          // height: 400,
          width: AppResponsiveness.setWidth(context, width: .8),

          decoration: BoxDecoration(
            color: AppTheme.background(context),
            borderRadius: BorderRadius.circular(AppSizes.radius60),
            border: Border.all(color: AppTheme.borderColor(context)),
          ),
          padding: EdgeInsets.only(
            left: AppSizes.padding32,
            right: AppSizes.padding32,
            top: AppSizes.padding32,
            bottom: AppSizes.padding32,
          ),
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      backgroundColor: uniqueColor,
                      side: BorderSide(color: uniqueColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(
                          AppSizes.radius20,
                        ),
                      ),
                      label: Text(
                        lableText,
                        style: AppStyles.secondaryStyle(
                          context: context,
                          fontSize: AppSizes.font16,
                          color: AppTheme.whiteText(context),
                          fontWeight: AppStyles.w500,
                        ),
                      ),
                    ),
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

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 20,
                      children: [
                        if (onPlayStoreTap != null)
                          GestureDetector(
                            onTap: onPlayStoreTap,
                            child: CustomSvg(
                              assetPath: AppAssets.playstore,
                              color: uniqueColor,
                            ),
                          ),
                        if (onAppStoreTap != null)
                          GestureDetector(
                            onTap: onAppStoreTap,
                            child: CustomSvg(
                              assetPath: AppAssets.apple,
                              color: uniqueColor,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomSvg(
                      assetPath: AppAssets.ellipses,
                      height: null,
                      width: null,
                      color: uniqueColor,
                    ),
                    Image.asset(
                      assetPath,
                      fit: BoxFit.contain,
                      height: AppResponsiveness.getSize(
                        onWeb: 400,
                        onMobile: 300,
                        onTablet: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
