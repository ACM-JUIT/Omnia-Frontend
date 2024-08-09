import 'package:flutter/material.dart';
import 'package:omnia/features/navbar/models/side_menu.dart';

class SideMenuItem extends StatelessWidget {
  final SideMenu menu;
  final int selectedMenu;
  final VoidCallback press;
  const SideMenuItem({
    super.key,
    required this.menu,
    required this.selectedMenu,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: selectedMenu == menu.index ? 288 : 0,
            height: 56,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF6792FF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              menu.image,
              height: 26,
              width: 26,
            ),
            title: Text(
              menu.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: press,
          ),
        ],
      ),
    );
  }
}
