import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Core/App_Icon/app_icon.dart';
import 'package:ui_generator_app/Core/App_Veriable/app_veriable.dart';
import 'package:ui_generator_app/Presention/Homapage/Widgets/circle_and_svg.dart';
import 'package:ui_generator_app/Presention/Homapage/Widgets/custom_end_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _HomepageState extends State<Homepage> {
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width > 400
            ? 400
            : MediaQuery.of(context).size.width,
        child: Scaffold(
          key: scaffoldKey,
          endDrawerEnableOpenDragGesture: false,
          endDrawer: const CustomEndDrawer(),
          backgroundColor: AppColor.blurGrey,
          body: SafeArea(
            child: PageFlipBuilder(
              key: pageFlipKey,
              frontBuilder: (_) => FlipPage(
                key: const ValueKey(1),
                list: AppVeriable.itemListOne,
                onFlip: () => pageFlipKey.currentState?.flip(),
              ),
              backBuilder: (_) => FlipPage(
                key: const ValueKey(2),
                list: AppVeriable.itemListTwo,
                onFlip: () => pageFlipKey.currentState?.flip(),
              ),
            ),
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
      itemModel: list[index],
    );
  }
}
