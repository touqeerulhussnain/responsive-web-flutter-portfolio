import 'dart:math';
import 'package:flutter/material.dart';

class FigureEightIcon extends StatefulWidget {
  final Widget icon;
  const FigureEightIcon({super.key, required this.icon});

  @override
  State<FigureEightIcon> createState() => _FigureEightIconState();
}

class _FigureEightIconState extends State<FigureEightIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
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
        double t = _controller.value * 2 * pi;

        // Lemniscate (∞ shape)
        double dx = sin(t) * 12;
        double dy = sin(t * 2) * 6;

        return Transform.translate(offset: Offset(dx, dy), child: child);
      },
      child: widget.icon,
    );
  }
}
