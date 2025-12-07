import 'dart:math';
import 'package:flutter/material.dart';

class UpDownFloatIcon extends StatefulWidget {
  final Widget icon;
  const UpDownFloatIcon({super.key, required this.icon});

  @override
  State<UpDownFloatIcon> createState() => _UpDownFloatIconState();
}

class _UpDownFloatIconState extends State<UpDownFloatIcon>
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

        double dy = sin(t * pi * 2) * 10; // up/down
        double dx = cos(t * pi * 2) * 5; // slight sideways

        return Transform.translate(offset: Offset(dx, dy), child: child);
      },
      child: widget.icon,
    );
  }
}
