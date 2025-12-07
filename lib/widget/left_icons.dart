import 'package:flutter/material.dart';
import 'package:open_source_flutter_portfolio/widget/animation/pulse_float_motion.dart';
import 'package:open_source_flutter_portfolio/widget/animation/up_down_drift_modtion.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_theme.dart';
import '../core/utils/app_responsiveness.dart';
import 'custom_svg.dart';
import 'animation/floating_animation.dart';

class LeftIcons extends StatelessWidget {
  const LeftIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          left: AppResponsiveness.setWidth(context, width: .1),
          top: AppResponsiveness.setHeight(context, height: .0),
          child: CircularFloatingIcon(
            icon: CustomSvg(
              assetPath: AppAssets.compositionMac,
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
          left: AppResponsiveness.setWidth(context, width: .17),
          top: AppResponsiveness.setHeight(context, height: .15),
          child: PulseFloatIcon(
            icon: CustomSvg(
              assetPath: AppAssets.book,
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
          left: AppResponsiveness.setWidth(context, width: .1),
          top: AppResponsiveness.setHeight(context, height: .28),
          child: UpDownFloatIcon(
            icon: CustomSvg(
              assetPath: AppAssets.abacus,
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
