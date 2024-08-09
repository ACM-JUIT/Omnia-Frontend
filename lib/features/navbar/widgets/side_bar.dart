import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/features/navbar/models/side_menu.dart';
import 'package:omnia/features/navbar/widgets/side_menu_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedSideMenu = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: primaryColor, // Replace with your color
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      30,
                    ),
                  ),
                  child: Image.asset(
                    "assets/acmlogo.png",
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            ...List.generate(
              sideMenu.length,
              (index) {
                final menu = sideMenu[index];
                return SideMenuItem(
                  press: () {
                    setState(() {
                      selectedSideMenu = menu.index;
                    });
                    Future.delayed(
                        const Duration(
                          milliseconds: 300,
                        ), () {
                      menu.onTap();
                    });
                  },
                  menu: menu,
                  selectedMenu: selectedSideMenu,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
