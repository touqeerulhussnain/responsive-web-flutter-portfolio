import 'dart:ui';

import 'package:flutter/material.dart';

// Custom DottedBorder class for dotted border support
class DottedBorder {
  static BoxBorder all({
    required Color color,
    double strokeWidth = 1.0,
    List<double> dashPattern = const [15, 8],
  }) {
    return _DottedBorder(
      color: color,
      strokeWidth: strokeWidth,
      dashPattern: dashPattern,
    );
  }
}

class _DottedBorder extends BoxBorder {
  final Color color;
  final double strokeWidth;
  final List<double> dashPattern;

  const _DottedBorder({
    required this.color,
    required this.strokeWidth,
    required this.dashPattern,
  });

  @override
  BorderSide get bottom => BorderSide.none;

  @override
  BorderSide get top => BorderSide.none;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(strokeWidth);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    if (shape == BoxShape.circle) {
      path.addOval(rect);
    } else if (borderRadius != null) {
      path.addRRect(borderRadius.toRRect(rect));
    } else {
      path.addRect(rect);
    }

    _drawDashedPath(canvas, path, paint, dashPattern);
  }

  void _drawDashedPath(
    Canvas canvas,
    Path path,
    Paint paint,
    List<double> dashArray,
  ) {
    final PathMetrics pathMetrics = path.computeMetrics();
    for (final PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      bool draw = true;

      while (distance < pathMetric.length) {
        final double length = dashArray[draw ? 0 : 1];
        if (draw) {
          canvas.drawPath(
            pathMetric.extractPath(distance, distance + length),
            paint,
          );
        }
        distance += length;
        draw = !draw;
      }
    }
  }

  @override
  ShapeBorder scale(double t) => this;
}
