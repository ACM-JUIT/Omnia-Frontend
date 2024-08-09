import 'package:flutter/foundation.dart';
import 'package:omnia/constants/utils/launch_url.dart';

class SideMenu {
  final String title;
  final String image;
  final VoidCallback onTap;
  final int index;

  SideMenu({
    required this.title,
    required this.image,
    required this.onTap,
    required this.index,
  });
}

List<SideMenu> sideMenu = [
  SideMenu(
    title: "LinkedIn",
    image: "assets/linkedin.png",
    onTap: () => launchURL(
      'https://www.linkedin.com/company/acmjuit/mycompany/',
    ),
    index: 0,
  ),
  SideMenu(
    title: "Instagram",
    image: "assets/insta.png",
    onTap: () => () => launchURL(
          'https://www.instagram.com/acmjuit/',
        ),
    index: 1,
  ),
  SideMenu(
    title: "Twitter",
    image: "assets/x3.png",
    onTap: () => launchURL(
      'https://x.com/AcmJuit',
    ),
    index: 2,
  ),
  SideMenu(
    title: "Github",
    image: "assets/git.png",
    onTap: () => launchURL(
      'https://github.com/ACM-JUIT/',
    ),
    index: 3,
  ),
];
