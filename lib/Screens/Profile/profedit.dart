import 'dart:io';

import 'package:flutter/material.dart';
import '../../Resources/Theme/theme.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  // Controllers for Text Fields
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _bioController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _githubController = TextEditingController();
  final _twitterController = TextEditingController(); 
  File? _imageFile;

  // Save Function (Integration with your data storage method)
  void _saveData() {
   // ... Logic to save profile data using your preferred method ...
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing profile data (if available)
  }

  @override
  void dispose() {
    // Dispose controllers
    _nameController.dispose();
    _usernameController.dispose();
    // ... other controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          title: const Text(
            "Edit Your Profile",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
          IconButton(
            onPressed: _saveData,
            icon: const Icon(Icons.check),
          )
        ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack( // Using a Stack to overlay an edit icon
              alignment: Alignment.bottomRight,
              children: [
                // Replace with actual profile image handling
                CircleAvatar(
                  radius: 60, 
                  backgroundImage: _imageFile != null 
                  ? FileImage(_imageFile!)   // Display image if picked
                  : const AssetImage('assets/luffy.png') as ImageProvider, 
            ), 
                IconButton(
                  color: Colors.grey.shade600 ,
                  onPressed: _pickImage,
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Text Fields
            TextField(controller: _nameController, 
                      decoration: const InputDecoration(
                        labelText: 'Name')),
            
            const SizedBox(height: 10),
            TextField(controller: _usernameController, 
                      decoration: const InputDecoration(
                        labelText: 'Username')),

            const SizedBox(height: 10),
            TextField(controller: _bioController, 
                      maxLines: 3, 
                      decoration: const InputDecoration(labelText: 'Bio')),

            const SizedBox(height: 10),
            // Social Links
            _buildSocialLinkField('LinkedIn', _linkedinController),
            const SizedBox(height: 10),
            _buildSocialLinkField('GitHub', _githubController),
            const SizedBox(height: 10),
            _buildSocialLinkField('Twitter (or X)', _twitterController),
              ]
            )
          ),
        ),
    );
  }
// Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker(); // Create an instance of ImagePicker
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    // Set the state with the picked image file
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  Widget _buildSocialLinkField(String label, TextEditingController controller) {
    return TextField(
      controller: controller, 
      decoration: InputDecoration(
        labelText: label),
    );
  }

}


  