import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(child: Text('Social Media')),
            ),
            ListTile(
              leading: const Icon(Icons.facebook),
              title: const Text('Facebook'),
              onTap: () => _launchURL('https://www.facebook.com'),
            ),
            ListTile(
              leading: const Icon(Icons.transfer_within_a_station_rounded),
              title: const Text('Twitter'),
              onTap: () => _launchURL('https://www.twitter.com'),
            ),
            ListTile(
              leading: const Icon(Icons.linked_camera_outlined),
              title: const Text('LinkedIn'),
              onTap: () => _launchURL('https://www.linkedin.com'),
            ),
            ListTile(
              leading: const Icon(Icons.insert_page_break_rounded),
              title: const Text('Instagram'),
              onTap: () => _launchURL('https://www.instagram.com'),
            ),
            ListTile(
              leading: const Icon(Icons.youtube_searched_for),
              title: const Text('YouTube'),
              onTap: () => _launchURL('https://www.youtube.com'),
            ),
          ],
        ),
      
     
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
