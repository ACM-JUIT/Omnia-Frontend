import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
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
            leading: Image.asset("assets/linkedin.png", height: 26, width: 26),
            title: const Text(' LinkedIn'),
            onTap: () => _launchURL('https://www.linkedin.com/company/acmjuit/mycompany/'),
          ),
          ListTile(
            leading: Image.asset("assets/insta.png", height: 26, width: 26),
            title: const Text(' Instagram'),
            onTap: () => _launchURL('https://www.instagram.com/acmjuit/'),
          ),
          ListTile(
            leading: Image.asset("assets/x3.png", height: 26, width: 26),
            title: const Text(' Twitter'),
            onTap: () => _launchURL('https://x.com/AcmJuit'),
          ),
          ListTile(
            leading: Image.asset("assets/git.png", height: 30, width: 30),
            title: const Text('Github'),
            onTap: () => _launchURL('https://github.com/ACM-JUIT/'),
          ),
          const SizedBox(height: 10.0),
          const Divider(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
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
                      onTap: () => _launchURL('https://www.linkedin.com/in/antrimo/'),
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
                    ),
                    GestureDetector(
                      onTap: () => _launchURL('https://www.linkedin.com/in/aditya-kumar-a215k/'),
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
