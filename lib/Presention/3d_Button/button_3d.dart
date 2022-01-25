import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';
import 'package:ui_generator_app/Core/App_String/button_code.dart';
import 'package:ui_generator_app/Presention/CustomeAppBar/custome_appbar.dart';

class Button3d extends StatelessWidget {
  const Button3d({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.buttonBackground,
      appBar: const CustomeAppBar(
        uiCode: Button.code,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Wrap(
            spacing: 15,
            runSpacing: 20,
            children: [
              const ButtonUI(
                letter: "V",
              ),
              const ButtonUI(
                letter: "W",
              ),
              const ButtonUI(
                letter: "X",
              ),
              const ButtonUI(
                letter: "Y",
              ),
              const ButtonUI(
                letter: "Z",
              ),
              ButtonUI(
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonUI extends StatefulWidget {
  const ButtonUI({
    Key? key,
    this.width = 80,
    this.letter = "",
  }) : super(key: key);

  final double width;
  final String letter;

  @override
  State<ButtonUI> createState() => _ButtonUIState();
}

class _ButtonUIState extends State<ButtonUI> {
  double height = 80;
  bool _tap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (details) {
        setState(() {
          _tap = !_tap;
        });
      },
      onLongPressCancel: () {
        if (_tap) {
          setState(() {
            _tap = !_tap;
          });
        }
      },
      onLongPressUp: () {
        setState(() {
          _tap = !_tap;
        });
      },
      onTapDown: (details) {
        setState(() {
          _tap = !_tap;
        });
      },
      onTapUp: (details) {
        setState(() {
          _tap = !_tap;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 80,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          gradient: const LinearGradient(
            colors: [Color(0xFF282828), Color(0xFF202020)],
          ),
          boxShadow: [
            const BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 2,
              color: Color.fromRGBO(0, 0, 0, 0.75),
            ),
            BoxShadow(
              offset: _tap ? Offset.zero : const Offset(10, 16),
              blurRadius: 4,
              color: const Color.fromRGBO(0, 0, 0, 0.4),
            ),
          ],
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: _tap
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.fromLTRB(4, 3, 12, 14),
              height: _tap ? height : 70,
              width: _tap ? widget.width : widget.width - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: const Border(
                  left: BorderSide(
                    color: Color(0xFF000004),
                    width: 1,
                  ),
                  top: BorderSide(
                    color: Color(0xFF000009),
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: Color(0xFF000004),
                    width: 1,
                  ),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF232323),
                    Color(0xFF4A4A4A),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-3, -3),
                    blurRadius: 1,
                    color: Color.fromRGBO(255, 255, 255, 0.25),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              left: _tap ? 25 : 20,
              top: _tap ? 14 : 10,
              child: Text(
                widget.letter,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
