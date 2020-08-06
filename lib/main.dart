import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/menu_frame.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

//This widget is the root of your Application
@override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ViewSm',
    theme: ThemeData(
      primaryColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MenuFrame()
  );
}
}