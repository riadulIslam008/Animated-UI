import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Core/App_String/curved_ui_code.dart';
import 'package:ui_generator_app/Presention/CustomeAppBar/custome_appbar.dart';

class BackGroundUI extends StatelessWidget {
  const BackGroundUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
         width: MediaQuery.of(context).size.width > 400
            ? 400
            : MediaQuery.of(context).size.width,
        child: Scaffold(
          extendBodyBehindAppBar: true,
           appBar: const CustomeAppBar(
             uiCode: CurvedUI.code,
           ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(color: AppColor.blurGrey),
                              Container(
                                decoration: const BoxDecoration(
                                  color: AppColor.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(88),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.70,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(color: AppColor.whiteColor),
                              Container(
                                decoration: const BoxDecoration(
                                  color: AppColor.blurGrey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(88),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
