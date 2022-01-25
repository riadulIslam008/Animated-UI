class Fency {
  static const String code = '''
const double _height = 200;

class RotatedCircle extends StatefulWidget {
  const RotatedCircle({Key? key}) : super(key: key);

  @override
  State<RotatedCircle> createState() => _RotatedCircleState();
}

class _RotatedCircleState extends State<RotatedCircle>
    with TickerProviderStateMixin {
  late AnimationController controllerOne, controllerTwo, controllerThree;

  @override
  void initState() {
    initControllerOne();
    initControllerTwo();
    initControllerThree();

    super.initState();
  }

  void initControllerOne() {
    controllerOne =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    controllerOne.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllerOne.repeat();
      }
    });
    controllerOne.forward();
  }

  void initControllerTwo() {
    controllerTwo =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    controllerTwo.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllerTwo.repeat();
      }
    });
    controllerTwo.forward();
  }

  void initControllerThree() {
    controllerThree =
        AnimationController(vsync: this, duration: const Duration(seconds: 7));
    controllerThree.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllerThree.repeat();
      }
    });
    controllerThree.forward();
  }

  @override
  void dispose() {
    controllerOne.dispose();
    controllerTwo.dispose();
    controllerThree.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blurGrey,
      body: Center(
        child: SizedBox(
          width: _height,
          height: _height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              FencyBorder(
                controller: controllerOne,
              ),
              FencyBorder(
                controller: controllerTwo,
              ),
              FencyBorder(
                controller: controllerThree,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FencyBorder extends StatelessWidget {
  const FencyBorder({
    Key? key,
    required this.controller,
    this.height = _height,
  }) : super(key: key);
  final AnimationController controller;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => SizedBox(
        width: _height,
        height: _height,
        child: Transform.rotate(
          angle: 2 * pi * controller.value,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppColor.fencyBorderGradientColor,
              border: Border.all(
                color: AppColor.blurGrey,
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.elliptical(_height * 0.38, _height * 0.41),
                topRight: Radius.elliptical(_height * 0.62, _height * 0.44),
                bottomRight: Radius.elliptical(_height * 0.63, _height * 0.56),
                bottomLeft: Radius.elliptical(_height * 0.37, _height * 0.59),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
  ''';
}
