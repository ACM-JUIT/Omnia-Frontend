import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:omnia/Resources/Theme/theme.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  late TextEditingController _linkedinController;
  late TextEditingController _githubController;
  late TextEditingController _twitterController;
  File? _imageFile;
  final User? user = FirebaseAuth.instance.currentUser;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _usernameController = TextEditingController();
    _bioController = TextEditingController();
    _linkedinController = TextEditingController();
    _githubController = TextEditingController();
    _twitterController = TextEditingController();

    _fetchUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    _linkedinController.dispose();
    _githubController.dispose();
    _twitterController.dispose();
    super.dispose();
  }

  Future<void> _fetchUserData() async {
    if (user == null) {
      ElegantNotification.error(
        description: const Text("User not logged in"),
      );
      return;
    }

    final email = user!.email;
    if (email == null) {
      ElegantNotification.error(
        description: const Text("User email not found"),
      );
      return;
    }

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('UserModel').doc(email).get();
      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        setState(() {
          _nameController.text = userData['name'] ?? '';
          _usernameController.text = userData['usern'] ?? '';
          _bioController.text = userData['bio'] ?? '';
          _linkedinController.text = userData['linked'] ?? '';
          _githubController.text = userData['git'] ?? '';
          _twitterController.text = userData['twit'] ?? '';
          _profileImageUrl = userData['avatar'];
        });
      }
    } catch (e) {
      ElegantNotification.error(
        description: Text("Failed to fetch user data: $e"),
      );
    }
  }

  Future<void> _saveData() async {
    if (user == null) {
      ElegantNotification.error(
        description: const Text("User not logged in"),
      );
      return;
    }

    final email = user!.email;
    if (email == null) {
      ElegantNotification.error(
        description: const Text("User email not found"),
      );
      return;
    }

    try {
      String? profileImageUrl = _profileImageUrl;
      if (_imageFile != null) {
        profileImageUrl = await _uploadImage();
      }

      final userData = {
        'name': _nameController.text,
        'usern': _usernameController.text,
        'bio': _bioController.text,
        'twit': _twitterController.text,
        'git': _githubController.text,
        'linked': _linkedinController.text,
        if (profileImageUrl != null) 'avatar': profileImageUrl,
      };

      // Check if document exists
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('UserModel').doc(email).get();
      if (userDoc.exists) {
        await FirebaseFirestore.instance.collection('UserModel').doc(email).update(userData);
      } else {
        await FirebaseFirestore.instance.collection('UserModel').doc(email).set(userData);
      }

      ElegantNotification.success(
        description: const Text("Profile updated"),
      );

      await Future.delayed(const Duration(seconds: 2));

      Navigator.pop(context, {'imageFile': _imageFile});
    } catch (e) {
      ElegantNotification.error(
        description: Text("Failed to update profile: $e"),
      );
    }
  }

  Future<String> _uploadImage() async {
    try {
      final ref = FirebaseStorage.instance.ref().child('user/profile').child(user!.email!);
      UploadTask uploadTask = ref.putFile(_imageFile!);

      // Add listener for debugging purposes
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print('Task state: ${snapshot.state}');
        print('Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      }, onError: (e) {
        print('Error: $e');
      });

      final snapshot = await uploadTask;

      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw Exception('FirebaseException: ${e.message}');
    } catch (e) {
      throw Exception('An error occurred while uploading the image: $e');
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // Or ImageSource.camera 
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
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
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
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
            const SizedBox(height: 16),
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: _imageFile != null
                          ? FileImage(_imageFile!)
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
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildTextField(_nameController, 'Name'),
            const SizedBox(height: 16),
            _buildTextField(_usernameController, 'Username'),
            const SizedBox(height: 16),
            _buildTextField(_bioController, 'Bio', maxLines: 4),
            const SizedBox(height: 16),
            _buildTextField(_linkedinController, 'LinkedIn URL'),
            const SizedBox(height: 16),
            _buildTextField(_githubController, 'GitHub URL'),
            const SizedBox(height: 16),
            _buildTextField(_twitterController, 'Twitter URL'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveData,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
