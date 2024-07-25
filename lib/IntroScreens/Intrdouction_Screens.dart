import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/Compnents/CustomRoundButton.dart';
import 'package:food_ordering_app/Home_Screens/Home_Screen.dart';
import 'package:food_ordering_app/IntroScreens/Login%20and%20Signup%20Screens/Welcome_page.dart';
import 'package:food_ordering_app/main.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction_Screens extends StatefulWidget {
  const Introduction_Screens({super.key});

  @override
  State<Introduction_Screens> createState() => _Introduction_ScreensState();
}

class _Introduction_ScreensState extends State<Introduction_Screens> {

  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MyHomePage(title: '',)),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Column(
      children: [
        SizedBox(
          height: 100.h,
        ),
        Expanded(
          child: IntroductionScreen(
            key: introKey,
            globalBackgroundColor: Colors.white,
            allowImplicitScrolling: true,
            autoScrollDuration: 3000,
            infiniteAutoScroll: true,
            globalFooter: SizedBox(
              width: 318,
              height: 60,
              child: CustomRoundButton(btname: 'Next',onPressed: (){
                Get.to(()=> Home_Screen(),
                  transition: Transition.leftToRightWithFade,

                  duration: Duration(milliseconds: 500),

                );
              },)
          
            ),
            pages: [
              PageViewModel(
                title: "We provide best quality water ",
                body: "Instead of having to buy an entire share, invest any amount you want.",
                image: _buildImage('water_intro1.png'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Schedule when you want your water delivered",
                body: "Download the Stockpile app and master the market with our mini-lesson.",
                image: _buildImage('water_intro2.png'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Fast and responsibily delivery ",
                body: "Kids and teens can track their stocks 24/7 and place trades that you approve.",
                image: _buildImage('water_intro3.png'),
                decoration: pageDecoration,
              ),
            ],
            showDoneButton: false,
            showNextButton: false, // Add this line
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            controlsPadding: kIsWeb
                ? const EdgeInsets.all(12.0)
                : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            dotsContainerDecorator: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
