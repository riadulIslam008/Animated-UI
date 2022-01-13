// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Presention/Tic_Tac_Toe_UI/box_container.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 9,
            itemBuilder: (context, index) {
              if (index == 2 || index == 5) {
                return BoxContainer(
                  rightWidth: false,
                  index: index,
                );
              }
              if (index == 6 || index == 7) {
                return BoxContainer(
                  bottomWidth: false,
                  index: index,
                );
              }
              if (index == 8) {
                return BoxContainer(
                  bottomWidth: false,
                  rightWidth: false,
                  index: index,
                );
              } else {
                return BoxContainer(
                  index: index,
                );
              }
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
        ),
      ),
    );
  }
}
