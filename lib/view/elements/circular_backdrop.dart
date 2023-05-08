import 'package:flutter/material.dart';

class CircularBackgroundBackdrop extends StatelessWidget {
  const CircularBackgroundBackdrop({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: (screenHeight + screenWidth) * 1,
        width: (screenHeight + screenWidth) * 1,
        bottom: screenHeight * 1.25,
        right: screenWidth * -0.25,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(1500)),
        ));
  }
}
