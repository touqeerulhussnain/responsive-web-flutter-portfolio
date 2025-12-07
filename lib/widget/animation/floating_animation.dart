import 'dart:math';

import 'package:flutter/material.dart';

class CircularFloatingIcon extends StatefulWidget {
  final Widget icon;
  const CircularFloatingIcon({super.key, required this.icon});

  @override
  State<CircularFloatingIcon> createState() => _CircularFloatingIconState();
}

class _CircularFloatingIconState extends State<CircularFloatingIcon>
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
        double angle = _controller.value * 2 * pi;
        double radius = 20; // area size

        return Transform.translate(
          offset: Offset(cos(angle) * radius, sin(angle) * radius),
          child: child,
        );
      },
      child: widget.icon,
    );
  }
}
