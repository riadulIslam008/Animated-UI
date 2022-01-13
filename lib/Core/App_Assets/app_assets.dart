import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static const String pandulamClock = "assets/pandulam-clock.svg";
  static const String cigaretteUi = "assets/cigarette.svg";
  static const String circularChart = "assets/circular-chart.svg";
  static const String curvedUi = "assets/curved-ui.svg";
  static const String discordUi = "assets/discord-ui.svg";
  static const String factorialUi = "assets/factorial-tree.svg";
  static const String searchUI = "assets/search-ui.svg";
  static const String showSkills = "assets/show-skills.svg";
  static const String ticTacToeBoard = "assets/tic-tac-toe-board.svg";
  static const String pandulamImage = "assets/pandulam.png";

  static const List allIcons = [
    pandulamClock,
    cigaretteUi,
    circularChart,
    curvedUi,
    discordUi,
    factorialUi,
    searchUI,
    showSkills,
    ticTacToeBoard,
  ];

  static Future<void> preLoadSvg() async {
    for (var svgAsset in allIcons) {
      await precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, svgAsset),
          null);
    }
  }
}
