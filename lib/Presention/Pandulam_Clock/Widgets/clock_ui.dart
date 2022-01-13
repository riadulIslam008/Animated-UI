import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockUI extends StatefulWidget {
  const ClockUI({Key? key}) : super(key: key);

  @override
  State<ClockUI> createState() => _ClockUIState();
}

class _ClockUIState extends State<ClockUI> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final _date = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
  //  print(size);
    //
    // ─── CLOCK CIRCLE PAINT ──────────────────────────────────────────
    //
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var redius = min(centerX, centerY);

    var paint = Paint()..color = Colors.transparent;

    canvas.drawCircle(center, redius - 30, paint);

    //
    // ─── OUTLINED CIRCLE ─────────────────────────────────────────────
    //
    var outlinedPaint = Paint()
      ..color = const Color(0xFFEAECFF) //0xFFEAECFF
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    canvas.drawCircle(center, redius - 30, outlinedPaint);

    //
    // ────────────────────────────────────────────────────────────── I ──────────
    //   :::::: H O U R E   B R U S H : :  :   :    :     :        :          :
    // ────────────────────────────────────────────────────────────────────────
    //
    var hourBrush = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    var hourHandX =
        centerX + 40 * cos((_date.hour * 30 + _date.minute * 0.5) * pi / 180);
    var hourHandY =
        centerX + 40 * sin((_date.hour * 30 + _date.minute * 0.5) * pi / 180);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourBrush);
//     canvas.drawLine(center,Offset(centerX+30,centerY),hourBrush);

    //
    // ──────────────────────────────────────────────────────────────────── II ──────────
    //   :::::: M I N U T E     B R U S H : :  :   :    :     :        :          :
    // ──────────────────────────────────────────────────────────────────────────────
    //
    var minBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.pink, Colors.lightBlue])
          .createShader(Rect.fromCircle(center: center, radius: redius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;

    var minHandX = centerX + 50 * cos(_date.minute * 6 * pi / 180);
    var minHandY = centerX + 50 * sin(_date.minute * 6 * pi / 180);
//     canvas.drawLine(center,Offset(centerX-35 ,centerY+35),minBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minBrush);

    //
    // ──────────────────────────────────────────────────────────────── III ──────────
    //   :::::: S C E O N D   B R U S H : :  :   :    :     :        :          :
    // ──────────────────────────────────────────────────────────────────────────
    //
    var secondBrush = Paint()
      ..color = Colors.orange
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    var secondHandX = centerX + 67 * cos(_date.second * 6 * pi / 180); //0
    var secondHandY = centerX + 67 * sin(_date.second * 6 * pi / 180); //1

    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondBrush);

    //Center point
    final centerPoint = Paint()..color = const Color(0xFFEAECFF);

    canvas.drawCircle(center, 10, centerPoint);

    //Dash
    var dashBrush = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    var outerCircleRadius = redius;
    var innerCircleRadius = redius - 40;
    for (var i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => true;
}
