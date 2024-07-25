import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:food_ordering_app/Categories_Screen/Categories.dart';
import 'package:food_ordering_app/main.dart';
import 'package:get/get.dart';


import '../../Compnents/CustomRoundButton.dart';
import '../../Compnents/CustomTextFields.dart';
import 'Login.dart';


class Signup extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var namecontroller = TextEditingController();
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();

    void signUp() async {
      if (namecontroller.text.trim().isEmpty) {
        Get.snackbar(
          'Error',
          'Name cannot be blank',
          snackPosition: SnackPosition.TOP,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
      } else if(emailcontroller.text.trim().isEmpty){
        Get.snackbar(
            'Error',
            'Email cannot be empty',
            snackPosition: SnackPosition.TOP,
            forwardAnimationCurve: Curves.elasticInOut,
            reverseAnimationCurve: Curves.easeOut,
            backgroundColor: Colors.blue
        );
      } else if(passwordcontroller.text.trim().isEmpty){
        Get.snackbar(
            'Error',
            'Password cannot be empty',
            snackPosition: SnackPosition.TOP,
            forwardAnimationCurve: Curves.elasticInOut,
            reverseAnimationCurve: Curves.easeOut,
            backgroundColor: Colors.redAccent
        );
      }

      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim(),



        );


        Get.showSnackbar(

            GetSnackBar(
              title: "Successful",
              message: "User Successfuly Created",
              icon: const Icon(Icons.login_sharp),
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.green,
            )
        );



        Get.to(()=> Categories(),transition:Transition.rightToLeftWithFade);

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
            'Warning',
            'Password should be more than 6 characters',
            snackPosition: SnackPosition.TOP,
            forwardAnimationCurve: Curves.elasticInOut,
            reverseAnimationCurve: Curves.easeOut,
          );

        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            'Warning',
            'Email Already Registered',
            snackPosition: SnackPosition.TOP,
            forwardAnimationCurve: Curves.elasticInOut,
            reverseAnimationCurve: Curves.easeOut,
          );
        }

        else {
          print('Sign-up error: ${e.message}');
        }
      } catch (e) {
        print('Sign-up error: $e');
      }
    }
    return Scaffold(
        backgroundColor: Color(0xffF9F9F9),

        body: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Create Your Account',style: TextStyle(fontSize: 30.sp,color: Color(0xff5DCCFC),fontWeight: FontWeight.w600),),
            ),

            SizedBox(
              height: 20.h,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Please fill in your details to create \nyour account',style: TextStyle(fontSize: 15.sp,color: Color(0xff625D5D),fontWeight: FontWeight.w600),),
            ),

            SizedBox(
              height: 30.h,
            ),

            CustomTextField(lname: 'Name', hname: 'Enter Your Name', bgcolor: Color(0xffFFFFFF),
              controller: namecontroller,
            ),

            SizedBox(
              height: 20.h,
            ),

            CustomTextField(lname: 'Email', hname: 'Enter Your Email', bgcolor: Color(0xffFFFFFF),icon: Icons.email,
              controller: emailcontroller,
            ),

            SizedBox(
              height: 20.h,
            ),

            CustomTextField(lname: 'Password', hname: 'Enter Your Password', bgcolor: Color(0xffFFFFFF),icon: Icons.password,
              controller: passwordcontroller,
            ),

            SizedBox(
              height: 35.h,
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                  width: 330.w,
                  height: 52.h,
                  child: CustomRoundButton(btname: 'Create an account',
                    onPressed: signUp,
                  )),
            ),

            SizedBox(
              height: 15.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',style: TextStyle(fontSize: 15.sp,color: Color(0xff202244),fontWeight: FontWeight.w500),),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: InkWell(
                      onTap: (){
                        Get.to(()=> Login(),
                          transition: Transition.zoom,

                          duration: Duration(milliseconds: 500),
                        );
                      },
                      child: Text('Sign in',style: TextStyle(fontSize: 15.sp,color: Color(0xff18A0FB),fontWeight: FontWeight.w600),)),
                ),

              ],

            ),
          ],
        )
    );
  }
}
