import 'dart:io';
import 'package:flutter/material.dart';
import '../../Resources/Theme/theme.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final String? name;
  final String? bio;
  final String? username;
  final String? linkedInUrl;
  final String? githubUrl;
  final String? twitterUrl;
  final File? imageFile;

  const EditProfile({
    super.key, 
    this.name, 
    this.bio, 
    this.username, 
    this.linkedInUrl, 
    this.githubUrl, 
    this.twitterUrl, 
    this.imageFile
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // Controllers for Text Fields
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  late TextEditingController _linkedinController;
  late TextEditingController _githubController;
  late TextEditingController _twitterController;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _usernameController = TextEditingController(text: widget.username);
    _bioController = TextEditingController(text: widget.bio);
    _linkedinController = TextEditingController(text: widget.linkedInUrl);
    _githubController = TextEditingController(text: widget.githubUrl);
    _twitterController = TextEditingController(text: widget.twitterUrl);
    _imageFile = widget.imageFile;
  }

  @override
  void dispose() {
    // Dispose controllers
    _nameController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    _linkedinController.dispose();
    _githubController.dispose();
    _twitterController.dispose();
    super.dispose();
  }

  void _saveData() {
    Navigator.pop(context, {
      'name': _nameController.text,
      'bio': _bioController.text,
      'username': _usernameController.text,
      'linkedInUrl': _linkedinController.text,
      'githubUrl': _githubController.text,
      'twitterUrl': _twitterController.text,
      'imageFile': _imageFile,
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
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
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _imageFile != null
                        ? FileImage(_imageFile!)
                        : const AssetImage("assets/luffy.png") as ImageProvider,
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
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
