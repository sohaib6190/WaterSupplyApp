import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/Categories_Screen/Categories.dart';
import 'package:food_ordering_app/Categories_Screen/todo_Screen.dart';
import 'package:food_ordering_app/Home_Screens/Home_Screen.dart';
import 'package:food_ordering_app/IntroScreens/Intrdouction_Screens.dart';
import 'package:food_ordering_app/IntroScreens/Login%20and%20Signup%20Screens/Sign_in.dart';
import 'package:food_ordering_app/IntroScreens/Login%20and%20Signup%20Screens/Splash_Screen.dart';
import 'package:food_ordering_app/IntroScreens/Login%20and%20Signup%20Screens/Welcome_page.dart';
import 'package:food_ordering_app/provider/todo_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAGIp0O-ww_ruAGgqa_IG4En091LVZVEFg",
            authDomain: "foodie-e05a4.firebaseapp.com",
            projectId: "foodie-e05a4",
            storageBucket: "foodie-e05a4.appspot.com",
            messagingSenderId: "503510262277",
            appId: "1:503510262277:web:cb0c8156e38706d73c726c"
        ));
  } else {
    await Firebase.initializeApp();
  }
  runApp( MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TodoProvider(),
    child:  const MaterialApp(
      home: TodoScreen(),

    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:Container(child: Text('hello world'),),
    );
  }
}
