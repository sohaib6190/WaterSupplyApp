import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/Compnents/CustomTextFields.dart';
import 'package:food_ordering_app/Models/Categories_Model.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:item_count_number_button/item_count_number_button.dart';

import '../Compnents/CustomTopBar.dart';
import '../Constraints/Constraints.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Categories_list>> category_list;
  Map<int, TextEditingController> amountcontrollers = {};
  int _total = 0;

  @override
  void initState() {
    super.initState();
    category_list = getCategories();
  }

  Future<List<Categories_list>> getCategories() async {
    final url = Uri.parse('http://localhost:3040/read/details/categories');
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Categories_list> category_list = body.map((dynamic item) => Categories_list.fromJson(item)).toList();
      return category_list;
    } else {
      throw Exception('Failed to load categories');
    }
  }

  void updateTotal(List<Categories_list> category_list) {
    int total = 0;
    amountcontrollers.forEach((index, controller) {
      int quantity = int.tryParse(controller.text) ?? 0;
      int price = int.tryParse(category_list[index].prize.toString()) ?? 0;
      total += quantity * price;
    });
    setState(() {
      _total = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: FutureBuilder<List<Categories_list>>(
        future: category_list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Category found'));
          } else {
            return Column(
              children: AnimateList(
                interval: 400.ms,
                effects: [FadeEffect(duration: 300.ms)],
                children: [
                  CustomTopBar(text: 'Select'),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Categories_list cat_list = snapshot.data![index];
                        amountcontrollers[index] = TextEditingController();
                        return Column(
                          children: [
                            SizedBox(height: 15.h),
                            Container(
                              width: 325.w,
                              height: 120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/home_boy.jpg'),
                                    radius: 25.h,
                                    backgroundColor: Colors.white,
                                  ),
                                  title: Text(
                                    cat_list.bottle_name,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Color(0xff202244),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  subtitle: Text(
                                    cat_list.size,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: bodyTextColorLight,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        cat_list.prize.toString(),
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                        height: 30.h,
                                        child: CustomTextField(
                                          lname: '',
                                          hname: '',
                                          bgcolor: Colors.grey,
                                          controller: amountcontrollers[index]!,
                                          onChanged: (value) => updateTotal(snapshot.data!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        );
                      },
                    ),
                  ),
                  Text('Total: $_total'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
