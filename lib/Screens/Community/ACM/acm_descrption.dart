import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/Screens/Community/ACM/Sessions/session.dart';
import 'package:readmore/readmore.dart';

class ACMDetailsPage extends StatefulWidget {
  final String heading;
  final String imageUrl;
  final String tenureDescription;

  const ACMDetailsPage({
    Key? key,
    required this.tenureDescription,
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
                  color: const Color.fromARGB(255, 191, 194, 236),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.heading,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ReadMoreText(
                            widget.tenureDescription,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                            trimLines: 5,
                            colorClickableText: navColor,
                            trimMode: TrimMode.Length,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Read less',
                            moreStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            lessStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Session()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  gradientColor2,
                                  gradientColor1,
                                ],
                              ),
                              border: Border.all(color: itemColor, width: 0.6),
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
                                          "assets/qriosity.png",
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
                                            color: Colors.black.withOpacity(0.3),
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "2024-2025",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "ACM Sessions",
                                              style: TextStyle(
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
                      ),
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
