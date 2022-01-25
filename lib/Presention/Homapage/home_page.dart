import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Core/App_Icon/app_icon.dart';
import 'package:ui_generator_app/Core/App_Veriable/app_veriable.dart';
import 'package:ui_generator_app/Presention/Homapage/Widgets/circle_and_svg.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blurGrey,
        body: PageFlipBuilder(
          key: pageFlipKey,
          frontBuilder: (_) => FlipPage(
            key: UniqueKey(),
            list: AppVeriable.itemListOne,
            onFlip: () => pageFlipKey.currentState?.flip(),
          ),
          backBuilder: (_) => FlipPage(
            key: UniqueKey(),
            list: AppVeriable.itemListTwo,
            onFlip: () => pageFlipKey.currentState?.flip(),
          ),
        ),
      ),
    );
  }
}

class FlipPage extends StatelessWidget {
  const FlipPage({Key? key, required this.list, required this.onFlip})
      : super(key: key);
  final List list;
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (list.length == 6) ...[
                  rowSection(0, 1),
                  rowSection(2, 3),
                  rowSection(4, 5),
                ] else ...[
                  rowSection(0, 1),
                  rowSection(2, 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15 ),
                    child: circleIndex(4),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Center(
              child: IconButton(
                icon: const Icon(
                  AppIcon.flipIcon,
                  size: 30,
                  color: AppColor.whiteColor,
                ),
                onPressed: onFlip,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row rowSection(fristIndex, secondIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        circleIndex(fristIndex),
        circleIndex(secondIndex),
      ],
    );
  }

  circleIndex(index) {
    return CircleWithSvg(
      circleRadius: Get.width * 0.40,
      itemAssets: list[index].itemSvg,
      onPressed: list[index].ontapRoutes,
      titleText: list[index].itemName,
      svgColor: list[index].svgColor,
    );
  }
}
