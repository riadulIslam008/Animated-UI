import 'package:flutter/material.dart';

class CigareteView extends StatelessWidget {
  const CigareteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      shadows: <Shadow>[
                        Shadow(
                          color: Color.fromRGBO(0, 0, 0, 0.20),
                          offset: Offset(2, 5),
                        ),
                      ]),
                  children: <TextSpan>[
                    TextSpan(
                      text: "NOOOOO",
                      style: TextStyle(
                        color: Colors.orange[400],
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: "L".toLowerCase(),
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 20,
                      ),
                    ),
                    const TextSpan(
                      text: "SMOOOOOOOOOKING",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 20,
              width: 6,
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(-3, 0),
                      blurRadius: 1),
                  BoxShadow(
                      color: Color(0xFFFF0000),
                      offset: Offset(-1, 0),
                      blurRadius: 1),
                  BoxShadow(
                      color: Color(0xFFFF0000),
                      offset: Offset(5, 0),
                      blurRadius: 8, spreadRadius: 4),
                  BoxShadow(
                      color: Color(0x55555555),
                      offset: Offset(12, 0),
                      blurRadius: 0),
                  BoxShadow(
                      color: Color(0x66666666),
                      offset: Offset(16, 0),
                      blurRadius: 0, spreadRadius: 2),
                  BoxShadow(
                      color: Color(0x99999999),
                      offset: Offset(20, 0),
                      blurRadius: 2,spreadRadius: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
