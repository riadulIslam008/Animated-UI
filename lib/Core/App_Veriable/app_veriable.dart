import 'package:ui_generator_app/Core/App_Assets/app_assets.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Core/Model/item_model.dart';
import 'package:ui_generator_app/Routes/app_routes.dart';

class AppVeriable {
  static List itemListOne = <ItemModel>[
    ItemModel(
        itemName: "Pandulam Clock",
        itemSvg: AppAssets.allIcons[0],
        ontapRoutes: Routes.pandumlamClock,
        svgColor: AppColor.transparent),
    ItemModel(
        itemName: "Rolling Cigarette",
        itemSvg: AppAssets.allIcons[1],
        svgColor: AppColor.transparent,
        ontapRoutes: Routes.rollingCigarette),
    ItemModel(
        itemName: "Circular Chart",
        itemSvg: AppAssets.allIcons[2],
        svgColor: AppColor.transparent,
        ontapRoutes: Routes.circularChart),
    ItemModel(
        itemName: "Curved Ui",
        itemSvg: AppAssets.allIcons[3],
        svgColor: AppColor.whiteColor,
        ontapRoutes: Routes.curvedUi),
    ItemModel(
        itemName: "Discord Ui",
        itemSvg: AppAssets.allIcons[4],
        svgColor: AppColor.whiteColor,
        ontapRoutes: Routes.discordUI),
    ItemModel(
        itemName: "Factorial Tree",
        itemSvg: AppAssets.allIcons[5],
        svgColor: AppColor.greenColor,
        ontapRoutes: Routes.factorialTree),
  ];

  static List itemListTwo = <ItemModel>[
    ItemModel(
        itemName: "Skills",
        svgColor: AppColor.transparent,
        itemSvg: AppAssets.allIcons[7],
        ontapRoutes: Routes.skills),
    ItemModel(
        itemName: "Search Bar",
        itemSvg: AppAssets.allIcons[6],
        svgColor: AppColor.transparent,
        ontapRoutes: Routes.searchBar),
    ItemModel(
        itemName: "Tic Tac Toe Board",
        itemSvg: AppAssets.allIcons[8],
        svgColor: AppColor.whiteColor,
        ontapRoutes: Routes.ticTacToeBoard),
    ItemModel(
        itemName: "3d Button",
        itemSvg: AppAssets.allIcons[9],
        svgColor: AppColor.whiteColor,
        ontapRoutes: Routes.button3d),
    ItemModel(
        itemName: "fency Border",
        svgColor: AppColor.transparent,
        itemSvg: AppAssets.allIcons[10],
        ontapRoutes: Routes.rotatedCircle),
  ];
}
