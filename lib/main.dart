import 'package:flutter/material.dart';
import 'package:Cloud_Music/pages/home/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetEase Music',
      theme: ThemeData(
          primaryColor: Color(0xFFDB2C1F),
          primaryTextTheme: TextTheme(
              title: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  height: 1.5)),
          primaryIconTheme: IconThemeData(color: Colors.black),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            textTheme:
                TextTheme(title: TextStyle(color: Colors.black, fontSize: 18)),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          tabBarTheme: TabBarTheme(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Color(0xFFDB2C1F),
              unselectedLabelColor: Colors.black),
          disabledColor: Color(0xFF7F7F7),
          indicatorColor: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
