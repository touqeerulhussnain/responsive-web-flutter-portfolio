import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class RandomDriftIcon extends StatefulWidget {
  final Widget icon;
  final double maxOffset;
  const RandomDriftIcon({super.key, required this.icon, this.maxOffset = 10});

  @override
  State<RandomDriftIcon> createState() => _RandomDriftIconState();
}

class _RandomDriftIconState extends State<RandomDriftIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Offset _startOffset;
  late Offset _endOffset;
  final Random _random = Random();

  Offset _randomOffset() {
    return Offset(
      (_random.nextDouble() * widget.maxOffset) - (widget.maxOffset / 2),
      (_random.nextDouble() * widget.maxOffset) - (widget.maxOffset / 2),
    );
  }

  @override
  void initState() {
    super.initState();
    _startOffset = Offset.zero;
    _endOffset = _randomOffset();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        setState(() {
          _startOffset = _endOffset;
          _endOffset = _randomOffset();
        });
      }
    });
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
        final dx = lerpDouble(
          _startOffset.dx,
          _endOffset.dx,
          _controller.value,
        )!;
        final dy = lerpDouble(
          _startOffset.dy,
          _endOffset.dy,
          _controller.value,
        )!;

        return Transform.translate(offset: Offset(dx, dy), child: child);
      },
      child: widget.icon,
    );
  }
}
