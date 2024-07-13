import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.blue, // Replace with your color
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: primaryColor, // Replace with your color
              ),
              child: Center(
                child: Image.asset(
                  "assets/acmlogo.png",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset("assets/x.png", height: 20, width: 20),
            title: const Text('LinkedIn'),
            onTap: () => _launchURL('https://www.linkedin.com'),
          ),
          ListTile(
            leading: const Icon(Icons.insert_page_break_rounded),
            title: const Text('Instagram'),
            onTap: () => _launchURL('https://www.instagram.com'),
          ),
          ListTile(
            leading: Image.asset("assets/x.png", height: 20, width: 20),
            title: const Text('Twitter'),
            onTap: () => _launchURL('https://www.twitter.com'),
          ),
          ListTile(
            leading: const Icon(Icons.youtube_searched_for),
            title: const Text('YouTube'),
            onTap: () => _launchURL('https://www.youtube.com'),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            onTap: () => _launchURL('mailto:'),
          ),
          const SizedBox(height: 10.0),
          const Divider(),
          const SizedBox(height: 160.0),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Made by ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                GestureDetector(
                  onTap: () => _launchURL('https://www.linkedin.com/in/antrimo/'), // Replace with Kartikey's URL
                  child: const Text(
                    ' Kartikey',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 88, 88, 88),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
  
                Text(
                    ' and',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ), // Adjust spacing as needed
                GestureDetector(
                  onTap: () => _launchURL('https://www.linkedin.com/in/aditya-kumar-a215k/'), // Replace with Aditya's URL
                  child: const Text(
                    ' Aditya',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 80, 79, 79),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
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
