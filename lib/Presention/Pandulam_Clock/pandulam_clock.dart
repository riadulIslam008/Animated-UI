import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_generator_app/Presention/Pandulam_Clock/Widgets/clock_ui.dart';
import 'package:ui_generator_app/Presention/Pandulam_Clock/Widgets/pandulam_ui.dart';

class PandulamClock extends StatefulWidget {
  const PandulamClock({Key? key}) : super(key: key);

  @override
  State<PandulamClock> createState() => _PandulamClockState();
}

class _PandulamClockState extends State<PandulamClock>
    with SingleTickerProviderStateMixin {
  final _top = Get.height / 2;

  final TextStyle _style =const TextStyle(
    color: Colors.white,
  );

  late Animation animation;
  late AnimationController _animationController;

  animationSection() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.addListener(() {
      if (animation.isCompleted) {
        _animationController.reverse();
      } else if (animation.isDismissed) {
        _animationController.forward();
      }
      setState(() {});
    });
    _animationController.forward();
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    animation = Tween(begin: -0.5, end: 0.5).animate(_animationController);
  }

  @override
  void initState() {
    animationSection();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202F41),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: _top),
              Transform(
                alignment: const FractionalOffset(0.5, 0.0),
                transform: Matrix4.rotationZ(animation.value),
                child: const Center(
                  child: PandulamUI(),
                ),
              ),
            ],
          ),

//
// ─── THIS IS TIME SHOW SCETION  TRY TO COMMENT OUT THIS SCETION CZ UI IS NOT PERFECT
//
          Center(
            // top: Get.height / 2 - 73,
            // left: 83,
            child: CircleAvatar(
              backgroundColor: const Color(0xFF202F41),
              radius: 70,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text("12", style: _style),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 5),
                    alignment: Alignment.centerRight,
                    child: Text("3", style: _style),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text("6", style: _style),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    child: Text("9", style: _style),
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: Container(
                alignment: const FractionalOffset(0.5, 0.5),
                child: const ClockUI()),
          ),
        ],
      ),
    );
  }
}
