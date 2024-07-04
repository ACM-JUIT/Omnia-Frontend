import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/Screens/Community/ACM/Sessions/session_desc.dart';
import 'package:omnia/cardvalues.dart';

class Session extends StatefulWidget {
  const Session({Key? key}) : super(key: key);

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  void _navigateToDetailsPage(String sessionHeadings, String sessionSubheadings,
      String sessionImagesList, String sessionDescription,) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SessionDetailsPage(
            sessionHeadings: sessionHeadings,
            sessionSubheadings: sessionSubheadings,
            sessionImagesList: sessionImagesList,
            sessionDescription: sessionDescription,           
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              
              ListView.builder(
                shrinkWrap: true,
                itemCount: sessionCardNo,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToDetailsPage(
                        sessionSubheadings[index],
                        sessionHeadings[index],
                        sessionImagesList[index],
                        sessionDescription[index],
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            gradientColor2,
                            gradientColor1,
                          ]),
                          border: Border.all(color: itemColor,width: 0.6),
                          
                          borderRadius: BorderRadius.circular(10),
                          color: cardColor,
                        ),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
  children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        sessionImagesList[index],
        alignment: Alignment.center,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          color: Colors.black.withOpacity(0.3), // Adjust the opacity as needed
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sessionSubheadings[index],
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            sessionHeadings[index],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ],
),

                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
