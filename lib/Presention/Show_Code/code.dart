import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';

class ShowCode extends StatefulWidget {
  const ShowCode({Key? key}) : super(key: key);

  @override
  State<ShowCode> createState() => _ShowCodeState();
}

class _ShowCodeState extends State<ShowCode> {
  final String uiCode = Get.arguments[0];
  bool _visibily = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.pandulamPageBackground,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  final data = ClipboardData(text: uiCode);
                  Clipboard.setData(data);
                  setState(() {
                    _visibily = true;
                  });
                  Future.delayed(const Duration(milliseconds: 1500)).then((_) {
                    setState(() {
                      _visibily = false;
                    });
                  });
                },
                child: const Icon(Icons.copy_all, size: 35),
              ),
            )
          ],
        ),
        backgroundColor: AppColor.whiteColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              //controller: _controller,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 15),
                color: AppColor.pandulamPageBackground,
                child: Text(
                  uiCode,
                  style: const TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _visibily,
              child: Positioned(
                bottom: 100,
                left: MediaQuery.of(context).size.width * 0.35,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    "Text Copied",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
