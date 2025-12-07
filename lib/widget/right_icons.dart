import 'package:flutter/material.dart';
import 'package:open_source_flutter_portfolio/widget/animation/pulse_float_motion.dart';
import 'package:open_source_flutter_portfolio/widget/animation/random_drift_motion.dart';
import 'package:open_source_flutter_portfolio/widget/animation/up_down_drift_modtion.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_theme.dart';
import '../core/utils/app_responsiveness.dart';
import 'custom_svg.dart';
import 'animation/figure_eight_motion.dart';
import 'animation/floating_animation.dart';
import 'animation/wobble_float_motion.dart';

class RightIcons extends StatelessWidget {
  const RightIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          right: AppResponsiveness.setWidth(context, width: .1),
          top: AppResponsiveness.setHeight(context, height: .0),
          child: UpDownFloatIcon(
            icon: CustomSvg(
              assetPath: AppAssets.android,
              height: AppResponsiveness.getSize(
                onWeb: AppSizes.size76,
                onTablet: AppSizes.size66,
                onMobile: AppSizes.size56,
              ),
              width: AppResponsiveness.getSize(
                onWeb: AppSizes.size76,
                onTablet: AppSizes.size66,
                onMobile: AppSizes.size56,
              ),
              color: AppTheme.primary(context),
            ),
          ),
        ),
        Positioned(
          right: AppResponsiveness.setWidth(context, width: .17),
          top: AppResponsiveness.setHeight(context, height: .15),
          child: FigureEightIcon(
            icon: CustomSvg(
              assetPath: AppAssets.mobiles,
              height: AppResponsiveness.getSize(
                onWeb: AppSizes.size76,
                onTablet: AppSizes.size66,
                onMobile: AppSizes.size56,
              ),
              width: AppResponsiveness.getSize(
                onWeb: AppSizes.size76,
                onTablet: AppSizes.size66,
                onMobile: AppSizes.size56,
              ),
              color: AppTheme.primary(context),
            ),
          ),
        ),
        Positioned(
          right: AppResponsiveness.setWidth(context, width: .1),
          top: AppResponsiveness.setHeight(context, height: .28),
          child: WobbleFloatIcon(
            icon: CustomSvg(
              assetPath: AppAssets.lockCloud,
              height: AppResponsiveness.getSize(
                onWeb: AppSizes.size76,
                onTablet: AppSizes.size66,
                onMobile: AppSizes.size56,
              ),
              width: AppResponsiveness.getSize(
                onWeb: AppSizes.size76,
                onTablet: AppSizes.size66,
                onMobile: AppSizes.size56,
              ),
              color: AppTheme.primary(context),
            ),
          ),
        ),
      ],
    );
  }
}
