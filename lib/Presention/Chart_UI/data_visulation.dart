import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_String/chartui_code.dart';
import 'package:ui_generator_app/Presention/CustomeAppBar/custome_appbar.dart';

class CircularDataVisulation extends StatefulWidget {
  const CircularDataVisulation({
    Key? key,
  }) : super(key: key);

  @override
  State<CircularDataVisulation> createState() => _CircularDataVisulationState();
}

class _CircularDataVisulationState extends State<CircularDataVisulation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
         width: MediaQuery.of(context).size.width > 400
            ? 400
            : MediaQuery.of(context).size.width,
        child: Scaffold(
          extendBodyBehindAppBar: true,
           appBar:  const CustomeAppBar(
             uiCode: ChartUI.code,
           ),
          body: Center(
            child: LayoutBuilder(builder: (context, constraints) {
              return AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: constraints.maxHeight * 0.40,
                        width: constraints.maxWidth * 0.40,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(193, 214, 233, 1),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: -10,
                              blurRadius: 17,
                              color: Colors.white,
                              offset: Offset(-5, -5),
                            ),
                            BoxShadow(
                              spreadRadius: -2,
                              blurRadius: 10,
                              offset: Offset(7, 7),
                              color: Color.fromRGBO(146, 182, 216, 1),
                            ),
                          ],
                        ),
                        child: CustomPaint(
                          painter: PieChart(animationController.value),
                        ),
                      ),
                    );
                  });
            }),
          ),
        ),
      ),
    );
  }
}

class PieChart extends CustomPainter {
  PieChart(this.progressStroke);
  final double progressStroke;

  @override
  void paint(Canvas canvas, Size size) {
    Offset _center = Offset(size.width / 2, size.height / 2);
    double _radius = min(size.width / 2, size.height);

    final Paint _paint = Paint()
      ..strokeWidth = size.width * 0.40
      ..style = PaintingStyle.stroke;

    double _total = 0;
    for (var element in kColorsList) {
      _total += element["percentise"];
    }

    double startRadian = -pi / 2;

    for (var i = 0; i < kColorsList.length; i++) {
      final swapRadiant = kColorsList.elementAt(i);
      final colorCapacity =
          swapRadiant["percentise"] / _total * 2 * pi * progressStroke;
      _paint.color = swapRadiant["color"];
      canvas.drawArc(Rect.fromCircle(center: _center, radius: _radius),
          startRadian, colorCapacity, false, _paint);
      startRadian += colorCapacity;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

final List kColorsList = [
  {
    "color": Colors.purple,
    "percentise": 500,
  },
  {
    "color": Colors.lightBlue,
    "percentise": 250,
  },
  {
    "color": Colors.green,
    "percentise": 90,
  },
  {
    "color": Colors.orange,
    "percentise": 90,
  },
  {
    "color": Colors.red,
    "percentise": 100,
  },
  {
    "color": Colors.yellow,
    "percentise": 20,
  },
];
