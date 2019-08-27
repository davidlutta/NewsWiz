import 'package:flutter/material.dart';
import 'package:newswiz/screens/home_screen.dart';
import 'package:newswiz/screens/news_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

