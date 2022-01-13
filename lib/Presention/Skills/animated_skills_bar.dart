import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';

class SkillsBarList extends StatefulWidget {
  const SkillsBarList({Key? key}) : super(key: key);

  @override
  State<SkillsBarList> createState() => _SkillsBarListState();
}

class _SkillsBarListState extends State<SkillsBarList>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBackGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Column(
                  children: [
                    SkillsItem(
                        animationValue: animationController.value,
                        skillsPercentage: 70),
                    const SizedBox(height: 10),
                    SkillsItem(
                        animationValue: animationController.value,
                        skillsPercentage: 80),
                    const SizedBox(height: 10),
                    SkillsItem(
                        animationValue: animationController.value,
                        skillsPercentage: 90),
                    const SizedBox(height: 10),
                    SkillsItem(
                        animationValue: animationController.value,
                        skillsPercentage: 100),
                    const SizedBox(height: 10),
                    SkillsItem(
                        animationValue: animationController.value,
                        skillsPercentage: 60),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

class SkillsItem extends StatelessWidget {
  const SkillsItem(
      {Key? key, required this.animationValue, required this.skillsPercentage})
      : super(key: key);
  final double animationValue;
  final int skillsPercentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(children: [
        Container(
          height: 15,
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Row(
          children: [
            Container(
              height: 15,
              width: (Get.width - 30) * (skillsPercentage / 100) * animationValue,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const Spacer(),
          ],
        ),
        Center(
          child: Text("$skillsPercentage %", style:const TextStyle(color: AppColor.lightBackGround)),
        )
      ]),
    );
  }
}
