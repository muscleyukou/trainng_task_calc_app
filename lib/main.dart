import 'package:flutter/material.dart';
import 'package:trainngtaskcalcapp/logIn/top_info.dart';
import 'package:trainngtaskcalcapp/parts/font.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '筋トレタスク管理アプリ',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: regular,
      ),
      home:LogInScreen(),
    );
  }
}
