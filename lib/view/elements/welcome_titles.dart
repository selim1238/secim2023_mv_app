import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Welcome_title2 extends StatelessWidget {
  const Welcome_title2({
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
      height: screenHeight * 0.8,
      width: screenWidth * 0.6,
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.43,
          ),
          Container(
            height: screenHeight * 0.1,
            width: screenWidth * 0.8,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.075,
                ),
                Text(
                  'DOĞRU',
                  style: TextStyle(
                      fontSize: 34 * fontSizeFactor, color: Colors.white),
                ),
                SizedBox(width: 15.0),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 34 * fontSizeFactor,
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
          ),
        ],
      ),
    );
  }
}

class Welcome_title1 extends StatelessWidget {
  const Welcome_title1({
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
        height: screenHeight * 0.8,
        width: screenWidth * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.25,
                ),
                Container(
                  width: screenWidth * 0.3,
                  child: Text(
                    "Açık Kaynak kodlu",
                    style: TextStyle(
                        fontSize: 24 * fontSizeFactor, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenWidth * 0.3,
                  child: Text(
                    "Kullanıcılar tarafından oluşturulmuş",
                    style: TextStyle(
                        fontSize: 24 * fontSizeFactor, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenWidth * 0.3,
                  child: Text(
                    "Milletvekili Aday Bilgi Portalı",
                    style: TextStyle(
                        fontSize: 24 * fontSizeFactor, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
