// animated_theme_switcher.dart
import 'package:flutter/material.dart';

class AnimatedThemeSwitcher extends StatefulWidget {
  final VoidCallback onAnimationComplete;

  const AnimatedThemeSwitcher({required this.onAnimationComplete, super.key});

  @override
  State<AnimatedThemeSwitcher> createState() => _AnimatedThemeSwitcherState();
}

class _AnimatedThemeSwitcherState extends State<AnimatedThemeSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onAnimationComplete();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ClipPath(
          clipper: BottomToTopWaveClipper(progress: _animation.value),
          child: Container(
            width: size.width,
            height: size.height,
            color: Colors.black, // Wave color during transition
          ),
        );
      },
    );
  }
}

class BottomToTopWaveClipper extends CustomClipper<Path> {
  final double progress;

  BottomToTopWaveClipper({required this.progress});

  @override
  Path getClip(Size size) {
    final path = Path();
    final height = size.height * progress;
    path.addRect(
        Rect.fromLTRB(0, size.height - height, size.width, size.height));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
