import 'package:flutter/material.dart';
import 'package:forecast_x/theme/theme.dart';
import 'package:forecast_x/utils/ui_kit/app_loader/theme/theme.dart';

var _feature = StandartTheme().AppLoader;

class AppLoader extends StatefulWidget {
  final double size;
  final double strokeWidth;

  const AppLoader({
    super.key,
    this.size = 40.0,
    this.strokeWidth = 4.0,
  });

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CustomPaint(
          painter: _LoaderPainter(
            activeColor: _feature.color.activeColor,
            inactiveColor: _feature.color.inactiveColor,
            strokeWidth: widget.strokeWidth,
          ),
        ),
      ),
    );
  }
}

class _LoaderPainter extends CustomPainter {
  final Color activeColor;
  final Color inactiveColor;
  final double strokeWidth;

  _LoaderPainter({
    required this.activeColor,
    required this.inactiveColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Фоновая окружность (неактивная часть)
    final backgroundPaint = Paint()
      ..color = inactiveColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Активная часть (дуга)
    final foregroundPaint = Paint()
      ..color = activeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = -0.5;
    const sweepAngle = 1.0;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle * 3.14,
      sweepAngle * 3.14,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
