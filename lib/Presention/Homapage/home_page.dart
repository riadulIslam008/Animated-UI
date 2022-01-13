import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:ui_generator_app/Core/App_Icon/app_icon.dart';
import 'package:ui_generator_app/Core/App_Veriable/app_veriable.dart';
import 'package:ui_generator_app/Presention/Homapage/Widgets/circle_and_svg.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: Get.height - 40,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) => CircleWithSvg(
                circleRadius: 50,
                itemAssets: list[index].itemSvg,
                onPressed: list[index].ontapRoutes,
                titleText: list[index].itemName,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Center(
              child: IconButton(
                icon: const Icon(AppIcon.flipIcon, size: 30),
                onPressed: onFlip,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
