import 'package:flutter/material.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_sizes.dart';
import '/core/constants/app_styles.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/app_responsiveness.dart';
import '/widget/custom_svg.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.assetPath,
    required this.title,
    required this.description,
    this.onPlayStoreTap,
    this.onAppStoreTap,
    this.allowVerticleAdjustement = true,
    required this.uniqueColor,
    this.height = AppSizes.height130,
    this.width = AppSizes.width130,
    required this.lableText,
    this.onWeb,
  });
  final String assetPath;
  final String title;
  final String lableText;
  final String description;
  final Function()? onPlayStoreTap;
  final Function()? onAppStoreTap;
  final Function()? onWeb;
  final Color uniqueColor;
  final double height;
  final double width;
  final bool allowVerticleAdjustement;
  @override
  Widget build(BuildContext context) {
    Widget text = Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chip(
          backgroundColor: uniqueColor,
          side: BorderSide(color: uniqueColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(AppSizes.radius20),
          ),
          label: Text(
            lableText,
            style: AppStyles.secondaryStyle(
              context: context,
              fontSize: AppResponsiveness.getSize(
                onWeb: AppSizes.font16,
                onMobile: AppSizes.font12,
                onSmallMobile: AppSizes.font12,
              ),
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
            if (onWeb != null)
              GestureDetector(
                onTap: onWeb,
                child: CustomSvg(assetPath: AppAssets.web, color: uniqueColor),
              ),
          ],
        ),
      ],
    );
    Widget image = Stack(
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
    );

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
            borderRadius: BorderRadius.circular(AppSizes.radius60),
            border: Border.all(color: uniqueColor),
            boxShadow: [
              BoxShadow(
                color: uniqueColor.withOpacity(.3),
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(0, 5),
              ),
              // BoxShadow(
              //   color: AppTheme.background(context),
              //   blurRadius: 1,
              //   spreadRadius: .2,
              //   offset: Offset(0, 5),
              // ),
            ],
          ),
          padding: EdgeInsets.only(
            left: AppSizes.padding32,
            right: AppSizes.padding32,
            top: AppSizes.padding32,
            bottom: AppSizes.padding32,
          ),
          child: AppResponsiveness.getDynamic(
            onWeb: Row(
              spacing: 10,
              children: [
                Expanded(flex: 3, child: text),
                Expanded(flex: 2, child: image),
              ],
            ),
            onMobile: allowVerticleAdjustement
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [text, image],
                  )
                : null,
            smallMobile: allowVerticleAdjustement
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [text, image],
                  )
                : null,
          ),
        );
      },
    );
  }
}
