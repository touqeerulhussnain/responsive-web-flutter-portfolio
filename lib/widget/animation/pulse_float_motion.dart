import 'dart:math';
import 'package:flutter/material.dart';

class PulseFloatIcon extends StatefulWidget {
  final Widget icon;
  const PulseFloatIcon({
    super.key,
    required this.icon,
    this.repeat = true,
    this.count,
  });
  final bool repeat;
  final int? count;

  @override
  State<PulseFloatIcon> createState() => _PulseFloatIconState();
}

class _PulseFloatIconState extends State<PulseFloatIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: widget.repeat, count: widget.count);
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

        double scale = 1 + (sin(t * pi * 2) * 0.03); // 3% pulse
        double dy = sin(t * pi * 2) * 6; // float
        double dx = cos(t * pi * 2) * 4; // tiny drift

        return Transform.translate(
          offset: Offset(dx, dy),
          child: Transform.scale(scale: scale, child: child),
        );
      },
      child: widget.icon,
    );
  }
}
