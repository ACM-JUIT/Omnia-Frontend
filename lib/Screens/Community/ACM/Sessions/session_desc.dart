import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/Resources/widget_tiles.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
  late PageController _pageController;
  int _currentPage = 0;
  bool read = false; // Add a state variable to manage read state
  MyWidgets mywidget = const MyWidgets();

  void toggleRead() {
    setState(() {
      read = !read;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showImageFullscreen(String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(imageUrl, fit: BoxFit.contain),
          ),
        );
      },
    );
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
              Center(
                child: Image.asset(
                  widget.sessionPoster,
                  fit: BoxFit.contain,
                  // width: MediaQuery.of(context).size.width * 0.9,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 191, 194, 236),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: mywidget.descWid(widget.sessionDescription, read, toggleRead)
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 200,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              PageView.builder(
                                controller: _pageController,
                                itemCount: widget.gallery.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _showImageFullscreen(widget.gallery[index]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Card(
                                        elevation: 11,
                                        shadowColor: const Color.fromARGB(255, 7, 7, 7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            widget.gallery[index],
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context).size.width * 0.8,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                bottom: 10,
                                child: DotsIndicator(
                                  dotsCount: widget.gallery.length,
                                  position: _currentPage,
                                  decorator: DotsDecorator(
                                    color: Colors.grey,
                                    activeColor: Colors.blue,
                                    size: const Size.square(9.0),
                                    activeSize: const Size(18.0, 9.0),
                                    spacing: const EdgeInsets.symmetric(horizontal: 4.0),
                                    activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
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
    );
  }
}
