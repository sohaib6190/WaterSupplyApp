import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/Compnents/Cards_Home.dart';
import 'package:food_ordering_app/Compnents/CustomRoundButton.dart';
import 'package:food_ordering_app/Constraints/Constraints.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Categories_Screen/Categories.dart';
import '../Compnents/CustomRoundButton_small.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCFF4FF),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              splashRadius: 20.0,
              splashColor: Color(0xff001A46),
              icon: const Icon(Icons.notifications),

                 tooltip: 'Comment Icon',
                      onPressed: () {},

                ),
          ),

        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height*0.2.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/landing_water.jpg'),
                  fit: BoxFit.fill
                )
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Hydrated All \nAlone',style: TextStyle(fontSize: 30.sp,color: Color(0xff202244),fontWeight: FontWeight.w600,fontFamily: 'Poppins'),)),
              ),
            ),

            Gap(20),

            Container(
              width: 355.w,
              height:150.h ,
              // color: Colors.lightBlue,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: Colors.white,
              ),
              child: GridView.count(
                  crossAxisCount: 2,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      RichText(

                        text: TextSpan(
                          text: 'Premium Plan!\n',
                          style: TextStyle(fontSize: 15, fontFamily: 'Poppins',fontWeight: FontWeight.bold),
                          children: <TextSpan>[

                            TextSpan(
                              text: 'hello to the world of water!\n',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff707070)
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: SizedBox(
                            width: 100.w,
                            height: 30.w,
                            child: CustomRoundButtonsmall(btname: 'Buy Now',onPressed: (){},)),
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/home_boy.jpg')
                          )
                      ),
                    ),
                  )


                ],


              ),
            ),


            Gap(20),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCard(icon: Icons.request_page,text: 'Send Request',bgcolor: Colors.green,),
                CustomCard(icon: Icons.payment,text: 'Payment Detail',bgcolor: Colors.red,),
                CustomCard(icon: Icons.track_changes,text: 'Track Order',bgcolor: Colors.blue,),
              ],
            ),

            Gap(10),




            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Items',style: TextStyle(fontSize: 15.sp,color: Color(0xff202244),fontWeight: FontWeight.w800),),
              ),

                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                      onTap: (){
                        Get.to(()=>   Categories(),transition:Transition.rightToLeftWithFade);
                      },
                      child: Text('See All',style: TextStyle(fontSize: 15.sp,color: Color(0xff202244),fontWeight: FontWeight.w500),)),
                ),


              ],
            ),

            Container(
              width: 325.w,
              height: 110.h,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child:
              Center(
                child: ListTile(

                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/home_boy.jpg'),
                    radius: 25.h,

                    backgroundColor: Colors.white,
                  ),

                  title: Text('Bottle 1',style :TextStyle(fontSize: 20.sp,color: Color(0xff202244),fontWeight: FontWeight.bold,fontFamily: 'Poppins')),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(15.sp),
                      Text('size:20 ltr',style :TextStyle(fontSize: 16.sp,color: bodyTextColorLight,fontWeight: FontWeight.w300,fontFamily: 'Poppins')),
                      Text('Qty:2',style :TextStyle(fontSize: 16.sp,color: bodyTextColorLight,fontWeight: FontWeight.w300,fontFamily: 'Poppins')),
                    ],
                  ),
                  trailing:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('20.00',style :TextStyle(fontSize: 20.sp,color: Colors.green,fontWeight: FontWeight.w800,fontFamily: 'Poppins')),
                       Text('In Progress',style :TextStyle(fontSize: 10.sp,color: Colors.red,fontWeight: FontWeight.w300,fontFamily: 'Poppins'))
                     ],
                  )

                ),
              ),
            ),

          ],


        ),
      ) ,
    );
  }
}
