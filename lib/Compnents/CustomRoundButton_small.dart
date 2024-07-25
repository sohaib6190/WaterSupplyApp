import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomRoundButtonsmall extends StatelessWidget {
  final String btname;

  final VoidCallback? onPressed;
  final Color? color;





  CustomRoundButtonsmall({
    required this.btname,
    this.onPressed,
    this.color


  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(btname,style: TextStyle(color: Colors.white,fontSize: 8.sp,fontWeight: FontWeight.w800,fontFamily:'Poppins'),),
      ),

      style: ElevatedButton.styleFrom(

        backgroundColor: Color(0xFF001A46),


      ),

    );

  }
}
