import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_Assets/app_assets.dart';

class PandulamUI extends StatelessWidget {
  const PandulamUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
   //   width: 300,
      child: Image.asset(AppAssets.pandulamImage),
    );
  }
}
