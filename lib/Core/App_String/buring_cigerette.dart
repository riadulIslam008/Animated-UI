class BurningCigerette {
  static const String code = '''
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
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.50),
      body: Transform(
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
    );
  }
}

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
  ''';
}
