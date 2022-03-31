import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.blurGrey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                    child: Center(child: Icon(Icons.arrow_back)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DrawerImtem(onTap: () {}, text: "rate this app"),
              DrawerImtem(onTap: () {}, text: "share this app"),
              DrawerImtem(onTap: () {}, text: "feedback"),
              DrawerImtem(onTap: () {}, text: "privacy policy"),
              DrawerImtem(onTap: () {}, text: "app version 1.0.0"),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerImtem extends StatelessWidget {
  const DrawerImtem({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
