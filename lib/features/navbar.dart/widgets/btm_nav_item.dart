import 'package:flutter/material.dart';
import 'package:omnia/features/navbar.dart/widgets/animated_bar.dart';
import 'package:rive/rive.dart';

import '../../../constants/models/menu.dart';

class BtmNavItem extends StatelessWidget {
  final Menu navBar;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final Menu selectedNav;
  const BtmNavItem({
    super.key,
    required this.navBar,
    required this.press,
    required this.riveOnInit,
    required this.selectedNav,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: selectedNav == navBar),
          SizedBox(
            height: 40,
            width: 40,
            child: Opacity(
              opacity: selectedNav == navBar ? 1 : 0.5,
              child: RiveAnimation.asset(
                navBar.rive.src,
                artboard: navBar.rive.artboard,
                onInit: riveOnInit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
