import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Core/Model/item_model.dart';
import 'package:ui_generator_app/Presention/Homapage/Widgets/custom_painter.dart';
import 'package:ui_generator_app/Presention/Homapage/home_page.dart';

class CircleWithSvg extends StatefulWidget {
  const CircleWithSvg({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

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
      onTap: () {
        if (widget.itemModel.itemName == "rate this app") {
          scaffoldKey.currentState!.openEndDrawer();
        } else {
          Get.toNamed(widget.itemModel.ontapRoutes);
        }
      },
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
        width: MediaQuery.of(context).size.width > 400
            ? 400 * 0.40
            : MediaQuery.of(context).size.width * 0.40,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => Column(
            children: [
              Stack(
                children: [
                  CircleUI(
                    progressStroke: animationController.value,
                    itemModel: widget.itemModel,
                  ),
                  Positioned.fill(
                    child: Center(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            widget.itemModel.itemSvg,
                            color: widget.itemModel.svgColor ==
                                    AppColor.transparent
                                ? null
                                : widget.itemModel.svgColor,
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
                  widget.itemModel.itemName.toUpperCase(),
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
