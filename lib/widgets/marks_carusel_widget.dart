import 'package:flutter/material.dart';

class MarksCaruselWidget extends StatefulWidget {
  final List<String> imagesList;
  final double height;
  final bool navigation;
  final double viewportFraction;
  final List<String>? titles;
  const MarksCaruselWidget({super.key, required this.imagesList, required this.height, this.navigation = false, this.viewportFraction = 0.8, this.titles});

  @override
  State createState() => _MarksCaruselWidgetState();
}

class _MarksCaruselWidgetState extends State<MarksCaruselWidget> {
  int _currentIndex = 0;
  // Using late because its been initialized in the initState
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      viewportFraction: widget.viewportFraction,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: widget.height,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                _currentIndex = index;
                // Update the state, so the indicators rebuild
                setState(() {});
              },
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    // Required widget with is not null
                    return child!;
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8, left: 8, top: 18, bottom: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.imagesList[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (widget.titles != null)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            widget.titles![index],
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
              itemCount: widget.imagesList.length,
            ),
          ),
          if (widget.navigation == true)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imagesList.length,
                (index) => Container(
                  margin: const EdgeInsets.all(1.5),
                  child: Icon(
                    Icons.circle,
                    size: 12.0,
                    color: _currentIndex == index ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
