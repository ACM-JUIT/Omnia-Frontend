import 'dart:math';

import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/features/navbar/models/bottom_menu.dart';
import 'package:omnia/constants/utils/rive_utils.dart';

import 'package:omnia/features/community/community.dart';
import 'package:omnia/features/Home/home.dart';
import 'package:omnia/features/Profile/profile.dart';
import 'package:omnia/features/Work/work.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:omnia/features/Signup/auth.dart';
import 'package:omnia/features/navbar/widgets/btm_nav_item.dart';
import 'package:omnia/features/navbar/widgets/menu_btn.dart';
import 'package:omnia/features/navbar/widgets/side_bar.dart';
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  final User? user = Auth().currentUser;

  final List<Widget> pages = [
    const MainHome(),
    const Community(),
    const Work(),
    const Profile(),
  ];
  int _page = 0;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  Menu selectedBottomNav = bottomNavItems.first;
  bool isSideBarOpen = false;

  late SMIBool isMenuOpenInput;

  void updateSelectedBtmBav(Menu menu) {
    setState(() {
      selectedBottomNav = menu;
      _page = menu.index;
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -288,
            top: 0,
            child: const SideBar(),
          ),
           Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                  1 * animation.value - 30 * (animation.value) * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      24,
                    ),
                  ),
                  child: pages[_page],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 400,
            ),
            left: isSideBarOpen ? 280 : 0,
            top: 16,
            child: MenuBtn(
              press: () {
                isMenuOpenInput.value = !isMenuOpenInput.value;

                if (_animationController.value == 0) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideBarOpen = !isSideBarOpen;
                });
              },
              riveOnInit: (artboard) {
                final controller = StateMachineController.fromArtboard(
                    artboard, 'State Machine');
                artboard.addController(controller!);

                isMenuOpenInput =
                    controller.findInput<bool>("isOpen") as SMIBool;
                isMenuOpenInput.value = true;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: Container(
          padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
          margin: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
          decoration: BoxDecoration(
            color: navColor,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: backgroundColor2.withOpacity(0.3),
                offset: const Offset(0, 20),
                blurRadius: 20,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavItems.length,
                  (index) {
                    Menu navBar = bottomNavItems[index];
                    return BtmNavItem(
                      navBar: navBar,
                      press: () {
                        RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                        updateSelectedBtmBav(navBar);
                      },
                      riveOnInit: (artboard) {
                        navBar.rive.status = RiveUtils.getRiveInput(
                          artboard,
                          stateMachineName: navBar.rive.stateMachineName,
                        );
                      },
                      selectedNav: selectedBottomNav,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
