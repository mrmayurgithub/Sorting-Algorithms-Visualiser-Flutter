import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'home_page.dart';

String _currentSortAlgo = 'bubble';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Sorting Visualiser',
      // theme: ThemeData(
      //   primaryColor: Colors.white,
      //   canvasColor: Colors.white,
      // ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
