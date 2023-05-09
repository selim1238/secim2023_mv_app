import 'package:flutter/material.dart';

import '../../main_excel.dart';

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
    return Container(
      height: (screenHeight + screenWidth) * 0.05,
      width: (screenHeight + screenWidth) * 0.05,
      child: Center(
        child: InkWell(
          onTap: () {
            MilletvekiliInits().readExcel();
          },
          child: Container(
            height: (screenHeight + screenWidth) * 0.05,
            width: (screenHeight + screenWidth) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(child: Image.asset("assets/ballot_box.png")),
          ),
        ),
      ),
    );
  }
}
