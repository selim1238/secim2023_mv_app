import 'package:flutter/material.dart';

class DeputyErrorHandler extends StatelessWidget {
  const DeputyErrorHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/milletvekili_error.gif",
        ),
        Text(
          "Milletvekili verilerini eklemeye devam ediyoruz daha sonra tekrar kontrol etmeyi deneyin.",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
