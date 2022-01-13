import 'package:get/get.dart';
import 'package:ui_generator_app/Presention/3d_Button/button_3d.dart';
import 'package:ui_generator_app/Presention/Animated_Search_UI/search.dart';
import 'package:ui_generator_app/Presention/Burning_Cigerate/burning_cigerate.dart';
import 'package:ui_generator_app/Presention/Chart_UI/data_visulation.dart';
import 'package:ui_generator_app/Presention/Curved_UI/background_curved_ui.dart';
import 'package:ui_generator_app/Presention/Discord_Ui/discord_ui.dart';
import 'package:ui_generator_app/Presention/Factorial_Tree/facterial_tree.dart';
import 'package:ui_generator_app/Presention/Homapage/home_page.dart';
import 'package:ui_generator_app/Presention/Pandulam_Clock/pandulam_clock.dart';
import 'package:ui_generator_app/Presention/Skills/animated_skills_bar.dart';
import 'package:ui_generator_app/Presention/Tic_Tac_Toe_UI/game_board.dart';
import 'package:ui_generator_app/Routes/app_routes.dart';

class AppPages {
  static const initialRoutes = "/";

  static final  routes = [
    GetPage(name: initialRoutes, page: () =>  Homepage()),
    GetPage(name: Routes.pandumlamClock, page: () =>const PandulamClock()),
    GetPage(name: Routes.rollingCigarette, page: () => const BurningCigerate()),
    GetPage(
        name: Routes.circularChart, page: () => const CircularDataVisulation()),
    GetPage(name: Routes.curvedUi, page: () => const BackGroundUI()),
    GetPage(name: Routes.discordUI, page: () => const DiscordUI()),
    GetPage(name: Routes.factorialTree, page: () => const FacterialTree()),
    GetPage(name: Routes.searchBar, page: () => const Search()),
    GetPage(name: Routes.skills, page: () => const SkillsBarList()),
    GetPage(name: Routes.ticTacToeBoard, page: () => const GameBoard()),
    GetPage(name: Routes.button3d, page: () => const Button3d()),
  ];
}
