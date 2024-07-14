import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:readmore/readmore.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DetailsPage extends StatefulWidget {
  final String heading;
  final String subheading;
  final String imageUrl;
  final String eventsDescription;
  final List<String> eventsgallery;

  const DetailsPage({
    Key? key,
    required this.heading,
    required this.subheading,
    required this.imageUrl,
    required this.eventsDescription,
    required this.eventsgallery,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late PageController _pageController;
  int _currentPage = 0;

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
        backgroundColor: navColor, // Adjust background color if needed
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  widget.imageUrl,
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
                            widget.heading,
                            style: const TextStyle(
                              fontSize: 24,
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
                            child: ReadMoreText(
                              widget.eventsDescription,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                color: Colors.black87,
                              ),
                              trimLines: 5,
                              colorClickableText: Colors.blue,
                              trimMode: TrimMode.Length,
                              trimCollapsedText: 'Read more',
                              trimExpandedText: 'Read less',
                            ),
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
                                itemCount: widget.eventsgallery.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _showImageFullscreen(widget.eventsgallery[index]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Card(
                                        elevation: 11.0,
                                        shadowColor: const Color.fromARGB(255, 14, 13, 13),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            widget.eventsgallery[index],
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
                                  dotsCount: widget.eventsgallery.length,
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
