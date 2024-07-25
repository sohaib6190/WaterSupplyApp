import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/IntroScreens/Intrdouction_Screens.dart';
import 'package:food_ordering_app/IntroScreens/Login%20and%20Signup%20Screens/Welcome_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'Sign_in.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>  Get.to(()=> Introduction_Screens(),
          transition: Transition.leftToRightWithFade,

          duration: Duration(milliseconds: 500),

        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
        Center(
          child: Lottie.asset(

              'assets/images/lottie_Water.json',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.colorFilter(
                  ['wave02', '**'],
                  value: ColorFilter.mode(Colors.blue, BlendMode.src),
                ),
                ValueDelegate.colorFilter(
                  ['wave04', '**'],
                  value: ColorFilter.mode(Colors.red, BlendMode.src),
                ),
              ],
            ),



          ),
        ),
          
          Center(child: Text('Drip Water',style: TextStyle(fontSize: 50.sp,color: Colors.white,fontWeight: FontWeight.w700,fontFamily: 'Poppins')
          ).animate()
              .fadeIn(duration: 500.ms)
              .scale(delay: 500.ms),
          )
        ],
      ),
      
      // body:   Center(
      //   child: Lottie.asset(
      //       'assets/images/Splash_Screen.json',
      //       width: 100.w,
      //       height: 150.h,
      //       fit: BoxFit.fill,
      //    
      //   ),
      //  
      //
      // ),

    );
  }
}
