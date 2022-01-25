import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_Assets/app_assets.dart';

class PandulamUI extends StatelessWidget {
  const PandulamUI({Key? key, required this.screenHeight}) : super(key: key);
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
   //   width: 300,
      child: Image.asset(AppAssets.pandulamImage),
    );
  }
}
