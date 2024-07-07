import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:readmore/readmore.dart';

class SessionDetailsPage extends StatefulWidget {
  final String sessionHeadings;
  final String sessionSubheadings;
  final String sessionPoster;
  final String sessionDescription;
  final List<String> gallery;

  const SessionDetailsPage({
    Key? key,
    required this.sessionDescription,
    required this.sessionHeadings,
    required this.sessionSubheadings,
    required this.sessionPoster,
    required this.gallery,
  }) : super(key: key);

  @override
  State<SessionDetailsPage> createState() => _SessionDetailsPageState();
}

class _SessionDetailsPageState extends State<SessionDetailsPage> {
  late List<String> gallery;

  @override
  void initState() {
    super.initState();
    gallery = widget.gallery;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: navColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(widget.sessionPoster),
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
                          widget.sessionHeadings,
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
                            widget.sessionDescription,
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
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: gallery.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Image.asset(gallery[index]),
                            );
                          },
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
