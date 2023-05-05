import 'package:flutter/material.dart';

class BallotBox extends StatelessWidget {
  const BallotBox({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required AnimationController floatingAnimationController,
    required Animation<Offset> floatingAnimation,
  })  : _floatingAnimationController = floatingAnimationController,
        _floatingAnimation = floatingAnimation;

  final double screenWidth;
  final double screenHeight;
  final AnimationController _floatingAnimationController;
  final Animation<Offset> _floatingAnimation;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all((screenHeight + screenWidth) * 0.05),
        child: Container(
          height: (screenHeight + screenWidth) * 0.15,
          width: (screenHeight + screenWidth) * 0.15,
          child: Center(
            child: Container(
              height: (screenHeight + screenWidth) * 0.15,
              width: (screenHeight + screenWidth) * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                  child: AnimatedBuilder(
                      animation: _floatingAnimationController,
                      builder: (BuildContext context, Widget? child) {
                        return FractionalTranslation(
                            translation: _floatingAnimation.value,
                            child: Image.asset("assets/ballot_box.png"));
                      })),
            ),
          ),
        ),
      ),
    );
  }
}
