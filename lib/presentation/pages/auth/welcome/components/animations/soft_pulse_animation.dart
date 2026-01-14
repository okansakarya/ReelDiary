import 'package:flutter/material.dart';

class SoftPulse extends StatefulWidget {
  const SoftPulse({
    required this.child,
    super.key,
    this.duration = const Duration(milliseconds: 1600),
    this.minScale = 0.985,
    this.maxScale = 1.015,
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final Duration duration;
  final double minScale;
  final double maxScale;
  final Curve curve;

  @override
  State<SoftPulse> createState() => _SoftPulseState();
}

class _SoftPulseState extends State<SoftPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);

    _scale = Tween<double>(begin: widget.minScale, end: widget.maxScale).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _scale, child: widget.child);
  }
}
