import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:readmore/readmore.dart';

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
  late List<String> eventsgallery;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    eventsgallery = widget.eventsgallery;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: navColor,
        body: SingleChildScrollView(
          child: Column(
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Center(
                          child: Text(
                            widget.heading,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
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
                          child: Center(
                            child: ReadMoreText(
                              widget.eventsDescription,
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
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
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
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Card(
                                    elevation: 6,
                                    shadowColor: const Color.fromARGB(255, 139, 138, 138),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        widget.eventsgallery[index],
                                        fit: BoxFit.cover,
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
            ],
          ),
        ),
      ),
    );
  }
}
