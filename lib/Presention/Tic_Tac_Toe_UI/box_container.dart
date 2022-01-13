import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$index Tapped")));
      },
      child: Container(
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
      ),
    );
  }
}
