import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_images.dart';

class PageControllerExample extends StatefulWidget {
  const PageControllerExample({super.key});

  @override
  State<PageControllerExample> createState() => _PageControllerExampleState();
}

class _PageControllerExampleState extends State<PageControllerExample> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 4, viewportFraction: 0.9);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageController example')),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {},
              reverse: false,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.garden),
                    ),
                  ),
                  child: Text(
                    '$index',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                );
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                  child: Text('Move'),
                  onPressed: () {
                    // log(pageController.offset.toString());
                    // log(pageController.page.toString());
                    pageController.jumpTo(750);
                  },
                ),
                ElevatedButton(
                  child: Text('Move animate'),
                  onPressed: () {
                    pageController.animateTo(
                      775,
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInBack,
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('Move to page'),
                  onPressed: () {
                    pageController.jumpToPage(4);
                  },
                ),
                ElevatedButton(
                  child: Text('Move animate to page'),
                  onPressed: () {
                    pageController.animateToPage(
                      4,
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInBack,
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('next page'),
                  onPressed: () {
                    pageController.nextPage(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInBack,
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('previous page'),
                  onPressed: () {
                    pageController.previousPage(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInBack,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
