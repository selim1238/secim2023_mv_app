import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class MaskedTopographWidget extends StatelessWidget {
  const MaskedTopographWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required AnimationController spinAnimationController,
  }) : _spinAnimationController = spinAnimationController;

  final double screenWidth;
  final double screenHeight;
  final AnimationController _spinAnimationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: (screenHeight + screenWidth) * 1,
        width: (screenHeight + screenWidth) * 1,
        right: screenWidth * -0.2,
        top: screenWidth * -1.12,
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_spinAnimationController),
          child: WidgetMask(
            blendMode: BlendMode.screen,
            mask: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1500),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      opacity: 0.4,
                      image: AssetImage(
                        "assets/topograph_bg.png",
                      ))),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 102, 0),
                  borderRadius: BorderRadius.circular(1500)),
            ),
          ),
        ));
  }
}
