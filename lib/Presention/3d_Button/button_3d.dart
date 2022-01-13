import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';

class Button3d extends StatefulWidget {
  const Button3d({Key? key}) : super(key: key);

  @override
  _Button3dState createState() => _Button3dState();
}

class _Button3dState extends State<Button3d> {
  double left = 20.0;
  double top = 0.0;
  double width = 20.0;
  double height = 20.0;
  final Curve _curves = Curves.ease;
  Duration duration = const Duration(milliseconds: 70);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Center(
          child: SizedBox(
            width: 220,
            height: 80,
            child: GestureDetector(
              onTapDown: (_) {
                setState(() {
                  left = 0.0;
                  top = 20.0;
                  width = 0.0;
                  height = 0.0;
                });
              },
              onTapUp: (_) {
                setState(() {
                  left = 20.0;
                  top = 0.0;
                  width = 20.0;
                  height = 20.0;
                });
              },
              onTapCancel: () {
                setState(() {
                  left = 20.0;
                  top = 0.0;
                  width = 20.0;
                  height = 20.0;
                });
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 0.2,
                    child: Transform(
                      transform: Matrix4.skewY(-0.79),
                      origin: const Offset(20, 0),
                      child: AnimatedContainer(
                        duration: duration,
                        curve: _curves,
                        height: 60.0,
                        width: width,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 20.1,
                    child: Transform(
                      transform: Matrix4.skewX(-0.8),
                      child: Transform(
                        origin: const Offset(100, 10),
                        transform: Matrix4.rotationZ(pi),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 70),
                          curve: _curves,
                          height: height,
                          width: 200,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    left: left,
                    top: top,
                    curve: _curves,
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      child: const Text(
                        "Click Me",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    duration: duration,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
