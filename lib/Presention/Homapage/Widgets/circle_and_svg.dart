import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Presention/Homapage/Widgets/custom_painter.dart';

class CircleWithSvg extends StatefulWidget {
  const CircleWithSvg(
      {Key? key,
      required this.titleText,
      required this.onPressed,
      required this.circleRadius,
      required this.itemAssets, required this.svgColor})
      : super(key: key);
  final String titleText;
  final String itemAssets;
  final String onPressed;
  final double circleRadius;
  final Color svgColor;

  @override
  State<CircleWithSvg> createState() => _CircleWithSvgState();
}

class _CircleWithSvgState extends State<CircleWithSvg>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(widget.onPressed),
      onLongPressDown: (_) {
        animationController.forward();
      },
      onLongPressUp: () {
        if (animationController.status != AnimationStatus.completed) {
          animationController.reverse();
        }
      },
      onLongPressCancel: () {
        if (!animationController.isCompleted) {
          animationController.reverse();
        }
      },
      child: SizedBox(
        width: widget.circleRadius,
       // height: Get.height - 40 * 0.30,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => Column(
            children: [
              Stack(
                children: [
                  CircleUI(
                    progressStroke: animationController.value,
                  ),
                  Positioned.fill(
                    child: Center(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            widget.itemAssets,
                            color: widget.svgColor ==  AppColor.transparent ? null : widget.svgColor,
                            height: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              FittedBox(
                child: Text(
                  widget.titleText.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
