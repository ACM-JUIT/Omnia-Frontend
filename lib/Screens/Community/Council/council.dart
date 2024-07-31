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
                context: context,
                heading: 'Ritwija Deep',
                subheading: 'Chairperson',
                imagePath: 'assets/profile1.png',
                description: 'Led the community with strategic vision and guidance, overseeing all activities and ensuring alignment with ACM-JUIT’s goals.',
              ),
              // Custom card 2
              _buildCard(
                context: context,
                heading: 'Shashank Singh',
                subheading: 'Vice Chairperson',
                imagePath: 'assets/profile2.png',
                description: 'Assisted in managing the community’s operations and played a key role in implementing initiatives and coordinating events.',
              ),
              // Custom card 3
              _buildCard(
                context: context,
                heading: 'Manas Bajpai',
                subheading: 'Webmaster',
                imagePath: 'assets/profile3.png',
                description: 'Maintained and updated the community’s online presence, including creating and managing ACM-JUIT’s website and event-specific sites.  ',
              ),
              // Custom card 4
              _buildCard(
                context: context,
                heading: 'Vidushi Dwivedi',
                subheading: 'Treasurer',
                imagePath: 'assets/profile4.png',
                description: 'Vidushi Dwivedi is the Treasurer, responsible for managing the council\'s finances.',
              ),
              // Custom card 5
              _buildCard(
                context: context,
                heading: 'Yatharth',
                subheading: 'Secretary',
                imagePath: 'assets/profile5.png',
                description: 'Handled documentation, meeting notes, and internal communications, ensuring organized and efficient management of community activities.',
              ),
              _buildCard(
                context: context,
                heading: 'Nikhilesh',
                subheading: 'Membership Chair',
                imagePath: 'assets/profile1.png',
                description: 'Oversaw member recruitment, retention, and engagement, working to grow and support the community’s membership base.',
              ),
              _buildCard(
                context: context,
                heading: 'Vidhi Jaiswal',
                subheading: 'Creative Head',
                imagePath: 'assets/profile2.png',
                description: 'Directed creative efforts, including event branding, content creation, and design, to enhance the community’s visual and thematic appeal.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String heading,
    required String subheading,
    required String imagePath,
    required String description,
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
            _showDescriptionDialog(context, heading, subheading, description);
          },
        ),
      ),
    );
  }

  void _showDescriptionDialog(
    BuildContext context, String heading, String subheading, String description) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Center(
          child: Text(
            heading,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blueAccent,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Position: $subheading',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Close',
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}
