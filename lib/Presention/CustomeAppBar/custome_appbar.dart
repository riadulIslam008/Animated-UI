import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Routes/app_routes.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({
    Key? key,
    required this.uiCode,
  }) : super(key: key);
  final String uiCode;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColor.pandulamPageBackground,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 15, bottom: 15),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.codepage, arguments: [uiCode]);
              },
              child: const Text(
                "<CODE>",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(58);
}
