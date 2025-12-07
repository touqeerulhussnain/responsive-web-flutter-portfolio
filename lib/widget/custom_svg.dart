import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/core/utils/app_responsiveness.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({
    super.key,
    required this.assetPath,
    this.height = 24,
    this.width = 24,
    this.color,
  });
  final String assetPath;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      //  height: height,
      // width:width,
      child: SvgPicture.asset(assetPath, color: color, fit: BoxFit.contain),
    );
  }
}
