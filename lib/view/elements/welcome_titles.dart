import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.fontSizeFactor,
  });

  final double screenHeight;
  final double screenWidth;
  final double fontSizeFactor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.15,
      width: screenWidth * 0.8,
      child: Row(
        children: <Widget>[
          SizedBox(width: 25.0),
          Text(
            'DOĞRU',
            style:
                TextStyle(fontSize: 28 * fontSizeFactor, color: Colors.white),
          ),
          SizedBox(width: 15.0),
          Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: DefaultTextStyle(
              style: TextStyle(
                  fontSize: 28 * fontSizeFactor,
                  fontFamily: 'Horizon',
                  color: Colors.white),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText('TERCİH'),
                  RotateAnimatedText('TEMSİL'),
                  RotateAnimatedText('MİLLETVEKİLİ'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
