import 'dart:async';

import 'package:flutter/material.dart';

String currentSortAlgo = 'merge';
Color sort_color = Colors.blue;
List<int> numbers = [];
int sampleSize = 400;
int duration = 500;
int c = 0;
List<Color> colors = List.generate(3, (index) => null);
int speed = 0;
StreamController<List<int>> streamController = StreamController();
bool isSorted = false;
bool isSorting = false;

Duration getDuration() {
  return Duration(microseconds: duration);
}

TextStyle comptext() {
  return TextStyle(letterSpacing: 1.0, fontStyle: FontStyle.italic);
}

TextStyle bottomBartext() => TextStyle(color: Colors.white);
