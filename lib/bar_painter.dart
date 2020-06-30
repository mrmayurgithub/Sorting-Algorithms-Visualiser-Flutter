import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class BarPainter extends CustomPainter {
  final double width;
  final int value;
  final int index;
  final int samplesize;
  final Color sort_color;
  BarPainter(
      {this.width, this.value, this.index, this.samplesize, this.sort_color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (sort_color == Colors.red) if (this.value < samplesize * .10) {
      paint.color = Color(0xFFFbf360c);
    } else if (this.value < samplesize * .20) {
      paint.color = Color(0xFFd84315);
    } else if (this.value < samplesize * .30) {
      paint.color = Color(0xFFe64a19);
    } else if (this.value < samplesize * .40) {
      paint.color = Color(0xFFf4511e);
    } else if (this.value < samplesize * .50) {
      paint.color = Color(0xFFff5722);
    } else if (this.value < samplesize * .60) {
      paint.color = Color(0xFFff7043);
    } else if (this.value < samplesize * .70) {
      paint.color = Color(0xFFff8a65);
    } else if (this.value < samplesize * .80) {
      paint.color = Color(0xFFffab91);
    } else if (this.value < samplesize * .90) {
      paint.color = Color(0xFFffccbc);
    } else {
      paint.color = Color(0xFFfbe9e7);
    }
    else if (sort_color == Colors.green) if (this.value < samplesize * .10) {
      paint.color = Color(0xFF0E4D64);
    } else if (this.value < samplesize * .20) {
      paint.color = Color(0xFF137177);
    } else if (this.value < samplesize * .30) {
      paint.color = Color(0xFF188977);
    } else if (this.value < samplesize * .40) {
      paint.color = Color(0xFF1D9A6C);
    } else if (this.value < samplesize * .50) {
      paint.color = Color(0xFF39A96B);
    } else if (this.value < samplesize * .60) {
      paint.color = Color(0xFF56B870);
    } else if (this.value < samplesize * .70) {
      paint.color = Color(0xFF74C67A);
    } else if (this.value < samplesize * .80) {
      paint.color = Color(0xFF99D492);
    } else if (this.value < samplesize * .90) {
      paint.color = Color(0xFFBFE1B0);
    } else {
      paint.color = Color(0xFFDEEDCF);
    }
    else if (sort_color == Colors.blue) if (this.value < samplesize * .10) {
      paint.color = Color(0xFF01579b);
    } else if (this.value < samplesize * .20) {
      paint.color = Color(0xFF0277bd);
    } else if (this.value < samplesize * .30) {
      paint.color = Color(0xFF0288d1);
    } else if (this.value < samplesize * .40) {
      paint.color = Color(0xFF039be5);
    } else if (this.value < samplesize * .50) {
      paint.color = Color(0xFF03a9f4);
    } else if (this.value < samplesize * .60) {
      paint.color = Color(0xFF29b6f6);
    } else if (this.value < samplesize * .70) {
      paint.color = Color(0xFF4fc3f7);
    } else if (this.value < samplesize * .80) {
      paint.color = Color(0xFF81d4fa);
    } else if (this.value < samplesize * .90) {
      paint.color = Color(0xFFb3e5fc);
    } else {
      paint.color = Color(0xFFe1f5fe);
    }

    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.square;

    canvas.drawLine(Offset(index * this.width, 900),
        Offset(index * this.width, (this.value + 200).ceilToDouble()), paint);
    // Paint paint2 = Paint();
    // Color _color;
    // if (sort_color == Colors.blue) _color = Colors.blue[100];
    // if (sort_color == Colors.red) _color = Colors.red[100];
    // if (sort_color == Colors.green) _color = Colors.green[100];

    // paint2.color = _color;
    // double radius = 100.0;
    // canvas.drawCircle(Offset(0.0, 0.0), radius, paint2);
    // canvas.drawLine(Offset(200, 60), Offset(220, 130), paint2);
    // canvas.drawLine(Offset(260, 60), Offset(280, 130), paint2);
    // canvas.drawLine(Offset(200, 80), Offset(280, 80), paint2);
    // canvas.drawLine(Offset(200, 120), Offset(280, 120), paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
