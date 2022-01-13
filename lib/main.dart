import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui_generator_app/Core/App_Assets/app_assets.dart';
import 'package:ui_generator_app/Presention/Burning_Cigerate/burning_cigerate.dart';
import 'package:ui_generator_app/Routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preLoadSvg();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      initialRoute: AppPages.initialRoutes,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
