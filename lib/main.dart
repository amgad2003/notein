import 'package:flutter/material.dart';
import 'package:notein/View/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF303030),
        appBarTheme: AppBarTheme(color: Color(0xFF303030)),
        fontFamily: "Poppins"
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
