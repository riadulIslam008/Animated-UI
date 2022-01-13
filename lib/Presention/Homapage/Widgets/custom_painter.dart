import 'dart:math';
import 'package:flutter/material.dart';

class CircleUI extends StatelessWidget {
  const CircleUI({Key? key, required this.progressStroke}) : super(key: key);
  final double progressStroke;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: CustomePainterImpl(
            progressStroke: progressStroke,
            taskCompleteColor: Colors.teal,
            taskNotCompleteColor: Colors.grey),
      ),
    );
  }
}

class CustomePainterImpl extends CustomPainter {
  CustomePainterImpl(
      {required this.progressStroke,
      required this.taskCompleteColor,
      required this.taskNotCompleteColor});
  final double progressStroke;
  final Color taskCompleteColor;
  final Color taskNotCompleteColor;

  @override
  void paint(Canvas canvas, Size size) {
    final bool isCompleted = progressStroke < 1.0;
    final _strokeWidth = size.width / 15;
    final _center = Offset(size.height / 2, size.width / 2);
    final _radius =
        isCompleted ? (size.width - _strokeWidth) / 2 : size.width / 2;

    if (isCompleted) {
      final backgroundPaint = Paint()
        ..isAntiAlias = true
        ..strokeWidth = _strokeWidth
        ..color = taskNotCompleteColor
        ..style = PaintingStyle.stroke;

      canvas.drawCircle(_center, _radius, backgroundPaint);
    }

    final foreGroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = _strokeWidth
      ..color = taskCompleteColor
      ..style = isCompleted ? PaintingStyle.stroke : PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: _center, radius: _radius),
      -pi / 2,
      pi * 2 * progressStroke,
      false,
      foreGroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomePainterImpl oldDelegate) =>
      oldDelegate.progressStroke != progressStroke;
}
