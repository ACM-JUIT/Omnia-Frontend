import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:omnia/cardvalues.dart';
import 'package:omnia/Resources/Theme/theme.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPopup();
    });
  }

  void _showPopup() {
    showDialog(
      context: context,
      barrierDismissible: true, // Allow closing the popup by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Upcoming Soon")),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                  width: 380,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: itemColor,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: searchColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        ),
                        labelText: 'Search Projects',
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: projectCardno,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              gradientColor2,
                              gradientColor1,
                            ]),
                            border: Border.all(color: imageColor),
                            borderRadius: BorderRadius.circular(10),
                            color: cardColor,
                            image: const DecorationImage(
                              alignment: Alignment.bottomCenter,
                              image: AssetImage("assets/proj.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 120,
                          width: 390,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        projectHeadings[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        projectSubheadings[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
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
                ),
              ],
            ),
          ),
          // Blurred background with popup
          if (_showPopupCondition)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
        ],
      ),
    );
  }
  
  bool get _showPopupCondition => true; // Placeholder for your popup condition
}
