import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/Screens/navbar.dart/navbar.dart';
import 'package:omnia/Screens/Profile/profedit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:omnia/Screens/Signup/auth.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final User? user = Auth().currentUser;

  Widget _userUID() {
    return Text(
      user?.email ?? 'User email',
      style: const TextStyle(
        color: Colors.blue,
      ),
    );
  }

  Future<void> signoutttt() async {
    await Auth().signTFOut();
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
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(image: AssetImage("assets/luffy.png")),
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
                  user?.displayName ?? 'User name',
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                        settings: const RouteSettings(name: 'Edit Profile'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.mode_edit_outline_outlined),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            // ID TAG
            const Text(
              '@nika',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 16,
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
              child: const Text(
                'BIO HERE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _userUID(),
            const SizedBox(height: 20),
            _signoutButt(),
          ],
        ),
      ),
    );
  }
}
