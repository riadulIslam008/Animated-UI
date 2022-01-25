import 'package:flutter/material.dart';

class AppColor {
  static const Color pandulamPageBackground =  Color(0xFF202F41);
  static const Color blurGrey = Color(0xFF263238);
  static const Color whiteColor = Colors.white;
  static const Color greenColor = Color(0xFF00C853);
  static const Gradient gradiantCoverBox = LinearGradient(
    colors: [blurGrey, greenColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const Color greyColor300 = Color(0xFFE0E0E0);
  static const Color greyColor = Colors.grey;
  static const Color greyColor100 = Color(0xFFCFD8DC);
  static const Color black12 = Colors.black12;
  static const Color lightBackGround = Color.fromRGBO(193, 214, 233, 1);

  static const Color royalBlue = Color(0xFF604FEF);

  static const Gradient fencyBorderGradientColor =
      LinearGradient(colors: [Colors.pink, royalBlue]);

  static const Color skillsBackGroundColor = Color(0xFFEDF1F4);
  static const Gradient skillsGradiantColor = LinearGradient(
    colors: [royalBlue, Color(0xFFA74DBC)],
  );

  static const Color buttonBackground = Color(0xFF232323);
  static const Color transparent = Colors.transparent;
}
