import 'package:flutter/material.dart';

class CustomSliderThumbRect extends SliderComponentShape {
  final double thumbRadius;
  final double thumbHeight;
  final double value;

  CustomSliderThumbRect({
    required this.thumbRadius,
    required this.thumbHeight,
    required this.value,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbRadius, thumbHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? textScaleFactor,
    Size? sizeWithOverflow,
    double? value,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = sliderTheme?.thumbColor ?? Colors.green
      ..style = PaintingStyle.fill;

    final centerRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: thumbRadius, height: thumbHeight),
      Radius.circular(thumbRadius * 0.2),
    );

    // Draw a rectangle instead of an oval
    canvas.drawRRect(centerRect, paint);

    // Display the value on the center of the thumb
    if (labelPainter != null) {
      labelPainter.text = TextSpan(
        text: this.value.toStringAsFixed(1),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins'
        ),
      );
      labelPainter.textDirection = textDirection ?? TextDirection.ltr;
      labelPainter.layout();

      final textPainterOffset = Offset(
        center.dx - labelPainter.width / 2.0,
        center.dy - labelPainter.height / 2.0,
      );
      labelPainter.paint(canvas, textPainterOffset);
    }
  }
}
