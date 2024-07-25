import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/Compnents/CustomRoundButton.dart';
import 'package:food_ordering_app/IntroScreens/Login%20and%20Signup%20Screens/Login.dart';
import 'package:get/get.dart';
import 'package:image_gradient/image_gradient.dart';

import 'Sign_in.dart';

class Welcome_Page extends StatelessWidget {
  const Welcome_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Stack(
        children: [
          ImageGradient.linear(
            image: Image.asset("assets/images/welcome.png"),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Colors.white60, Colors.black],
          ) ,


          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 600.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: SizedBox(
                    height: 52.h,
                    width: 360.w,
                    child: CustomRoundButton(btname: 'Create An Account',color:Colors.white,onPressed: (){
                      Get.to(()=> Signup(),
                        transition: Transition.zoom,

                        duration: Duration(milliseconds: 500),

                      );


                    },))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: SizedBox(
                    height: 52.h,
                    width: 360.w,
                    child: CustomRoundButton(btname: 'Login',onPressed: (){
                      Get.to(()=> Login(),
                        transition: Transition.circularReveal,

                        duration: Duration(milliseconds: 500),

                      );
                    },))),
              ),
            ],
          ),


        ],
      )
    );
  }
}
