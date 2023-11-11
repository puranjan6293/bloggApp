import 'package:flutter/material.dart';

class MultiColorCircularProgressIndicator extends StatelessWidget {
  final List<Color> colors;
  final double strokeWidth;
  final double value; // A value between 0 and 1

  const MultiColorCircularProgressIndicator({
    super.key,
    required this.colors,
    this.strokeWidth = 4.0,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(40, 40), // Set the size as per your requirement
      painter: MultiColorCircularProgressPainter(
        colors: colors,
        strokeWidth: strokeWidth,
        value: value,
      ),
    );
  }
}

class MultiColorCircularProgressPainter extends CustomPainter {
  final List<Color> colors;
  final double strokeWidth;
  final double value;

  MultiColorCircularProgressPainter({
    required this.colors,
    this.strokeWidth = 4.0,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double start = 0.0;
    double end = 0.0;

    for (int i = 0; i < colors.length; i++) {
      paint.color = colors[i];

      end = (value * 360 * (i + 1) / colors.length).clamp(0.0, 360.0);

      canvas.drawArc(
        Rect.fromCircle(
            center: size.center(Offset.zero), radius: size.width / 2),
        radians(start),
        radians(end),
        false,
        paint,
      );

      start = end;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

double radians(double degrees) {
  return degrees * (3.141592653589793238 / 180);
}
