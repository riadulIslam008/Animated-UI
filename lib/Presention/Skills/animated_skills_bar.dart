import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Core/App_String/Skills_code.dart';
import 'package:ui_generator_app/Presention/CustomeAppBar/custome_appbar.dart';

Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

class SkillsBarList extends StatefulWidget {
  const SkillsBarList({Key? key}) : super(key: key);

  @override
  State<SkillsBarList> createState() => _SkillsBarListState();
}

class _SkillsBarListState extends State<SkillsBarList>
    with TickerProviderStateMixin {
  late AnimationController animationControllerOne,
      animationControllerTwo,
      animationControllerThree,
      animationControllerFour;
  late Color colorOne, colorTwo, colorThree, colorFour;

  @override
  void initState() {
    colorOne = randomColor();
    colorTwo = randomColor();
    colorThree = randomColor();
    colorFour = randomColor();
    initanimationControllerOne();
    initanimationControllerTwo();
    initanimationControllerThree();
    initanimationControllerFour();
    super.initState();
  }

  void initanimationControllerOne() {
    animationControllerOne = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animationControllerOne.addStatusListener((status) {
      if (status == AnimationStatus.completed) animationControllerOne.reverse();
      if (status == AnimationStatus.dismissed) {
        setState(() {
          colorOne = randomColor();
        });
        animationControllerOne.forward();
      }
    });
    animationControllerOne.forward();
  }

  void initanimationControllerTwo() {
    animationControllerTwo = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    animationControllerTwo.addStatusListener((status) {
      if (status == AnimationStatus.completed) animationControllerTwo.reverse();
      if (status == AnimationStatus.dismissed) {
        setState(() {
          colorTwo = randomColor();
        });
          animationControllerTwo.forward();
      }
    });
    animationControllerTwo.forward();
  }

  void initanimationControllerThree() {
    animationControllerThree = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 850));
    animationControllerThree.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationControllerThree.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          colorThree = randomColor();
        });
        animationControllerThree.forward();
      }
    });
    animationControllerThree.forward();
  }

  void initanimationControllerFour() {
    animationControllerFour = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationControllerFour.addStatusListener((status) {
      if (status == AnimationStatus.completed) animationControllerFour.reverse();
      if (status == AnimationStatus.dismissed) {
         setState(() {
          colorFour = randomColor();
        });
        animationControllerFour.forward();
      }
    });
    animationControllerFour.forward();
  }

  @override
  void dispose() {
    animationControllerOne.dispose();
    animationControllerTwo.dispose();
    animationControllerThree.dispose();
    animationControllerFour.dispose();
    super.dispose();
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
          backgroundColor: AppColor.skillsBackGroundColor,
           appBar: const CustomeAppBar(
             uiCode: Skills.code,
           ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedBox(
                  controller: animationControllerOne,
                  color: colorOne,
                ),
                AnimatedBox(controller: animationControllerTwo, color: colorTwo),
                AnimatedBox(
                  controller: animationControllerThree,
                  color: colorThree,
                ),
                AnimatedBox(controller: animationControllerFour, color: colorFour),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedBox extends StatelessWidget {
  const AnimatedBox({Key? key, required this.controller, required this.color})
      : super(key: key);
  final AnimationController controller;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          height: 200,
          width: 40,
          decoration: BoxDecoration(
            color: AppColor.skillsBackGroundColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                offset: Offset(-4.5, -4.5),
                blurRadius: 15,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
              BoxShadow(
                offset: Offset(4.5, 4.5),
                blurRadius: 15,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 160,
                    minHeight: 0,
                  ),
                ),
              ),
              Container(
                height: 200 * controller.value,
                width: 40,
                constraints: const BoxConstraints(minHeight: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    32,
                  ),
                  color: color,
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundColor: AppColor.whiteColor,
                      radius: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}