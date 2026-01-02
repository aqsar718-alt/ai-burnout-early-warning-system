import 'package:flutter/material.dart';

class MicrosoftLogo extends StatelessWidget {
  final double size;

  const MicrosoftLogo({super.key, this.size = 24});

  @override
  Widget build(BuildContext context) {
    double squareSize = size / 2.2;
    double gap = size * 0.1;

    return SizedBox(
      width: size,
      height: size,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: squareSize,
                height: squareSize,
                color: const Color(0xFFF25022),
              ), // Red
              SizedBox(width: gap),
              Container(
                width: squareSize,
                height: squareSize,
                color: const Color(0xFF7FBA00),
              ), // Green
            ],
          ),
          SizedBox(height: gap),
          Row(
            children: [
              Container(
                width: squareSize,
                height: squareSize,
                color: const Color(0xFF00A4EF),
              ), // Blue
              SizedBox(width: gap),
              Container(
                width: squareSize,
                height: squareSize,
                color: const Color(0xFFFFB900),
              ), // Yellow
            ],
          ),
        ],
      ),
    );
  }
}
