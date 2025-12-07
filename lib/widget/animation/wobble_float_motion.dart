import 'dart:math';
import 'package:flutter/material.dart';

class WobbleFloatIcon extends StatefulWidget {
  final Widget icon;
  const WobbleFloatIcon({super.key, required this.icon});

  @override
  State<WobbleFloatIcon> createState() => _WobbleFloatIconState();
}

class _WobbleFloatIconState extends State<WobbleFloatIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        double t = _controller.value;

        double dx = sin(t * 2 * pi) * 6; // horizontal drift
        double dy = cos(t * 2 * pi) * 6; // vertical drift

        double angle = sin(t * 2 * pi) * 0.05; // slight rotation (radians)

        return Transform.translate(
          offset: Offset(dx, dy),
          child: Transform.rotate(angle: angle, child: child),
        );
      },
      child: widget.icon,
    );
  }
}
