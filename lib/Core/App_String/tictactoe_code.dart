class TicTacToe {
  static const String code = '''

  import 'package:flutter/material.dart

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

class BoxContainer extends StatelessWidget {
  BoxContainer(
      {Key? key,
      this.bottomWidth = true,
      this.rightWidth = true,
      required this.index})
      : super(key: key);

  final bool bottomWidth;
  final bool rightWidth;
  final int index;
  final Color blackColor = Colors.black;
  final Color transparent = Colors.transparent;

  final double _width = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: rightWidth ? blackColor : transparent,
              width: _width,
            ),
            bottom: BorderSide(
              color: bottomWidth ? blackColor : transparent,
              width: _width,
            ),
          ),
        ),
    );
  }
}
  ''';
}
