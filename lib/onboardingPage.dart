import 'package:flutter/material.dart';
import 'dart:io';
import 'package:testlogin_app/data/data.dart';
import 'package:testlogin_app/loginPage.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SlideTile(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
        color: Colors.green,
        height: Platform.isIOS ? 70 : 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                pageController.animateToPage(slides.length - 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
              },
              child: Text(
                "SKIP",
              ),
            ),
            Row(children: [
              for (int i = 0; i < slides.length; i++)
                currentIndex == i
                    ? pageIndexIndicator(true)
                    : pageIndexIndicator(false)
            ]),
            GestureDetector(
              onTap: () {
                pageController.animateToPage(currentIndex + 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
              },
              child: Text(
                "NEXT",
              ),
            ),
          ],
        ),
      )
          : Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: Platform.isIOS ? 80 : 70,
        color: Colors.green[900],
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return loginPage();
                  }));
            },
            child: Center(
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imageAssetPath, title, desc;
  SlideTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Color(0xff32723b),
          Image.asset(imageAssetPath),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}