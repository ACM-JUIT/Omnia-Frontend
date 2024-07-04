import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:omnia/Resources/Theme/theme.dart';

class ACMDetailsPage extends StatefulWidget {
  final String heading;
  final String imageUrl;

  const ACMDetailsPage({
    Key? key,
    required this.heading,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<ACMDetailsPage> createState() => _ACMDetailsPageState();
}

class _ACMDetailsPageState extends State<ACMDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: navColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(widget.imageUrl),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.heading,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
     
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


