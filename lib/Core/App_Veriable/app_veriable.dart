import 'package:ui_generator_app/Core/App_Assets/app_assets.dart';
import 'package:ui_generator_app/Core/Model/item_model.dart';
import 'package:ui_generator_app/Routes/app_routes.dart';

class AppVeriable {
  static List itemListOne = <ItemModel>[
    ItemModel(
        itemName: "Pandulam Clock",
        itemSvg: AppAssets.allIcons[0],
        ontapRoutes: Routes.pandumlamClock),
    ItemModel(
        itemName: "Rolling Cigarette",
        itemSvg: AppAssets.allIcons[1],
        ontapRoutes: Routes.rollingCigarette),
    ItemModel(
        itemName: "Circular Chart",
        itemSvg: AppAssets.allIcons[2],
        ontapRoutes: Routes.circularChart),
    ItemModel(
        itemName: "Curved Ui",
        itemSvg: AppAssets.allIcons[3],
        ontapRoutes: Routes.curvedUi),
    ItemModel(
        itemName: "Discord Ui",
        itemSvg: AppAssets.allIcons[4],
        ontapRoutes: Routes.discordUI),
    ItemModel(
        itemName: "Factorial Tree",
        itemSvg: AppAssets.allIcons[5],
        ontapRoutes: Routes.factorialTree),
  ];

  static List itemListTwo = <ItemModel>[
    ItemModel(
        itemName: "Skills",
        itemSvg: AppAssets.allIcons[7],
        ontapRoutes: Routes.skills),
    ItemModel(
        itemName: "Search Bar",
        itemSvg: AppAssets.allIcons[6],
        ontapRoutes: Routes.searchBar),
    ItemModel(
        itemName: "Tic Tac Toe Board",
        itemSvg: AppAssets.allIcons[8],
        ontapRoutes: Routes.ticTacToeBoard),
    ItemModel(
        itemName: "3d Button",
        itemSvg: AppAssets.allIcons[8],
        ontapRoutes: Routes.button3d),
  ];
}
