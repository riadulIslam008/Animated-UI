class Factorial {
  static const String code = '''
class FacterialTree extends StatelessWidget {
  const FacterialTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,         
        children: [
          Flexible(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1,
              child: CustomPaint(
                painter: TreePaint(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const degToRed = math.pi / 180.0;

class TreePaint extends CustomPainter {
  int depth = 12;

  @override
  void paint(Canvas canvas, Size size) {
    final lineLength = math.min(size.width, size.height) * 0.008;
    final x = size.width / 2;
    final y = size.height * 0.8;
    final Paint _paint = Paint()
      ..strokeWidth = depth * 0.2
      ..color = Colors.white;
    const double offset = 90 * 0.26;

    canvas.drawLine(Offset(x, y), Offset(x, (y + 100)), _paint);
    drawFunction(canvas, _paint, lineLength, x, y, depth, -90, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

void drawFunction(
    Canvas canvas, _paint, lineLength, x, y, depth, angle, double offset) {
  if (depth > 0) {
    if (depth < 6) {
      _paint = Paint()
        ..color = Colors.green
        ..strokeWidth = depth * 0.2;
    } else {
      _paint = Paint()
        ..color = Colors.white
        ..strokeWidth = depth * 0.2;
    }
    final x2 = x + (math.cos(angle * degToRed) * depth * lineLength);
    final y2 = y + (math.sin(angle * degToRed) * depth * lineLength);
    canvas.drawLine(Offset(x, y), Offset(x2, y2), _paint);
    drawFunction(
        canvas, _paint, lineLength, x2, y2, depth - 1, angle - offset, offset);
    drawFunction(
        canvas, _paint, lineLength, x2, y2, depth - 1, angle + offset, offset);
  }
}
  ''';
}
