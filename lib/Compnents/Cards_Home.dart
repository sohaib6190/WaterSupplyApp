import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? bgcolor;


  CustomCard({
    required this.text,
    this.onPressed,
    this.icon,
    this.bgcolor

  });
  @override
  Widget build(BuildContext context) {



    return SizedBox(
      height: 90.h,
      width: 90.w,

      child: Card(
         elevation: 20,
        color: Colors.white,

        child: Column(
           children: [
             Gap(10),
          Icon(icon,size: 20.sp,color: bgcolor,),
             Gap(15.sp),
        Text(text as String,style: TextStyle(fontSize: 10.sp,color: Color(0xff202244),fontWeight: FontWeight.w600)),
           ],
        ),
      ),

    );
  }

}
