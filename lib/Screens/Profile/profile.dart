import 'dart:io';

import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/Screens/navbar.dart/navbar.dart';
import 'package:omnia/Screens/Profile/profedit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:omnia/Screens/Signup/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = Auth().currentUser;
  String? displayName;
  String? bio;
  String? username;
  String? linkedInUrl;
  String? githubUrl;
  String? twitterUrl;
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    displayName = 'Name';
    bio = 'enter your bio here';
    username = '@username';
    linkedInUrl = 'https://linkedin.com/';
    githubUrl = 'https://github.com/';
    twitterUrl = 'https://twitter.com/';
  }

  Future<void> signoutttt() async {
    await Auth().signTFOut();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _signoutButt() {
    return ElevatedButton(
      onPressed: signoutttt,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text('Sign out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Nav();
            }));
          },
        ),
      ),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: _profileImage != null
                      ? FileImage(_profileImage!)
                      : const AssetImage("assets/luffy.png") as ImageProvider,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 50),
                Text(
                  displayName ?? 'User name',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  color: Colors.white,
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(
                          name: displayName,
                          bio: bio,
                          username: username,
                          linkedInUrl: linkedInUrl,
                          githubUrl: githubUrl,
                          twitterUrl: twitterUrl,
                          imageFile: _profileImage,
                        ),
                        settings: const RouteSettings(name: 'Edit Profile'),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        displayName = result['name'];
                        bio = result['bio'];
                        username = result['username'];
                        linkedInUrl = result['linkedInUrl'];
                        githubUrl = result['githubUrl'];
                        twitterUrl = result['twitterUrl'];
                        _profileImage = result['imageFile'];
                      });
                    }
                  },
                  icon: const Icon(Icons.mode_edit_outline_outlined),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            // ID TAG
            Text(
              username ?? '@nika',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            // Social Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _launchURL(linkedInUrl ?? 'https://linkedin.com/');
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/linky.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(githubUrl ?? 'https://github.com/');
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/gitboi.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(twitterUrl ?? 'https://twitter.com/');
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/x.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            // Bio
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Text(
                bio ?? 'BIO HERE',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user?.email ?? 'User email',
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            _signoutButt(),
          ],
        ),
      ),
    );
  }
}
