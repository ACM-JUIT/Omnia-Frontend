import 'dart:io';
import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/Resources/elegantnotif.dart';
import 'package:omnia/Screens/navbar.dart/navbar.dart';
import 'package:omnia/Screens/Profile/profedit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:omnia/Screens/Signup/auth.dart';
import 'package:omnia/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with RouteAware {
  User? user = Auth().currentUser;
  String? displayName;
  String? bio;
  String? username;
  String? linkedInUrl;
  String? githubUrl;
  String? twitterUrl;
  File? _profileImage;
  String? _profileImageUrl;
  Elegantnotif notif = const Elegantnotif();
  bool isLoading = true; // Variable to track loading state

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ModalRoute? route = ModalRoute.of(context);
    if(route is PageRoute){
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    _fetchUserData();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _fetchUserData() async {
    if (user == null) {
      return;
    }

    final email = user!.email;

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('UserModel').doc(email).get();
      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        setState(() {
          displayName = userData['name'] ?? 'Name';
          username = userData['usern'] ?? 'add username';
          bio = userData['bio'] ?? 'Enter your bio here';
          linkedInUrl = userData['linked'] ?? 'https://linkedin.com/';
          githubUrl = userData['git'] ?? 'https://github.com/';
          twitterUrl = userData['twit'] ?? 'https://twitter.com/';
          _profileImageUrl = userData['avatar'];
          isLoading = false; // Set loading to false when data is fetched
        });
      }
    } catch (e) {
      notif.myElegantError(context, "Failed to fetch user data: $e");
      setState(() {
        isLoading = false; // Set loading to false in case of error
      });
    }
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
        actions: [
          IconButton(
            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfile(),
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
          ),
        ],
      ),
      backgroundColor: primaryColor,
      body: isLoading // Show loader if loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _profileImage != null
                            ? FileImage(_profileImage!)
                            : (_profileImageUrl != null
                                ? NetworkImage(_profileImageUrl!)
                                : const AssetImage("assets/luffy.png")) as ImageProvider,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Name
                  Text(
                    displayName ?? 'User name',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // ID TAG
                  Text(
                    '@$username',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
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
                      const SizedBox(width: 16),
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
                      const SizedBox(width: 16),
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
                  const SizedBox(height: 45),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
