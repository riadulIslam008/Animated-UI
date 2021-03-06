import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_String/buring_cigerette.dart';
import 'package:ui_generator_app/Presention/Burning_Cigerate/Widgets/cigerate_view.dart';
import 'package:ui_generator_app/Presention/CustomeAppBar/custome_appbar.dart';

class BurningCigerate extends StatefulWidget {
  const BurningCigerate({Key? key}) : super(key: key);

  @override
  State<BurningCigerate> createState() => _BurningCigerateState();
}

class _BurningCigerateState extends State<BurningCigerate> {
  late FixedExtentScrollController _controller;

  late Timer _timer;

  @override
  void initState() {
    _controller = FixedExtentScrollController();
    int selectedIndex = 0;

    if (selectedIndex <= 9) {
      _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
        if (selectedIndex == 9) selectedIndex = 0;
        _controller.animateToItem(selectedIndex,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
        selectedIndex++;
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
         width: MediaQuery.of(context).size.width > 400
            ? 400
            : MediaQuery.of(context).size.width,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.50),
          appBar: const CustomeAppBar(
            uiCode: BurningCigerette.code,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(50),
              child: Center(
                child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemExtent: 80,
                  perspective: 0.007,
                  diameterRatio: 0.1,
                  onSelectedItemChanged: (index) {
                    index++;
                  },
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: [
                      for (var i = 0; i < 10; i++)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            CigareteView(),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
