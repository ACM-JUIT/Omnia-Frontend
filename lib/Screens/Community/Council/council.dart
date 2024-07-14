import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';

class Council extends StatefulWidget {
  const Council({super.key});

  @override
  State<Council> createState() => _CouncilState();
}

class _CouncilState extends State<Council> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        color: navColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Council Members',
                    style: TextStyle(
                      color: itemColor,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              // Custom card 1
              _buildCard(
                heading: 'Ritwija Deep',
                subheading: 'Chairperson',
                imagePath: 'assets/profile1.png',
              ),
              // Custom card 2
              _buildCard(
                heading: 'Shashank Singh',
                subheading: 'Vice Chairperson',
                imagePath: 'assets/profile2.png',
              ),
              // Custom card 3
              _buildCard(
                heading: 'Manas Bajpai',
                subheading: 'Webmaster',
                imagePath: 'assets/profile3.png',
              ),
              // Custom card 4
              _buildCard(
                heading: 'Vidushi Dwivedi',
                subheading: 'Treasurer',
                imagePath: 'assets/profile4.png',
              ),
              // Custom card 5
              _buildCard(
                heading: 'Yatharth',
                subheading: 'Secretary',
                imagePath: 'assets/profile5.png',
              ),
              _buildCard(
                heading: 'Nikhilesh',
                subheading: 'Membership Chair',
                imagePath: 'assets/profile1.png',
              ),
              _buildCard(
                heading: 'Vidhi Jaiswal',
                subheading: 'Creative Head',
                imagePath: 'assets/profile2.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String heading,
    required String subheading,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(heading),
          subtitle: Text(subheading),
          leading: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
          ),
          onTap: () {
            // Handle card
          },
        ),
      ),
    );
  }
}
