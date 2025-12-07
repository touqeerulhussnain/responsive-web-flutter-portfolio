import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_colors.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_sizes.dart';
import '../core/utils/copy_service.dart';
import 'custom_svg.dart';

class CopyButton extends StatelessWidget {
  final String textToCopy;

  const CopyButton({super.key, required this.textToCopy});

  @override
  Widget build(BuildContext context) {
    final isCopied = false.obs;

    return Obx(
      () => GestureDetector(
        onTap: () async {
          await CopyService.copyToClipboard(textToCopy);
          isCopied.value = true;
          await Future.delayed(const Duration(milliseconds: 500));
          isCopied.value = false;
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: isCopied.value
              ? CustomSvg(
                  key: const ValueKey('tick'),
                  assetPath: AppAssets.tick, // your tick icon
                  height: AppSizes.height32,
                  width: AppSizes.width32,
                  color: AppColors.darkGrey,
                )
              : CustomSvg(
                  key: const ValueKey('copy'),
                  assetPath: AppAssets.copy, // original copy icon
                  height: AppSizes.height32,
                  width: AppSizes.width32,
                  color: AppColors.darkGrey,
                ),
        ),
      ),
    );
  }
}
