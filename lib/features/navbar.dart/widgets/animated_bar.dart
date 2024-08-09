import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  final bool isActive;
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 2),
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: isActive ? 25 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFF81B4FF),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}