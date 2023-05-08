import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secim2023_mv_app/core/constants/constants.dart';
import 'package:secim2023_mv_app/core/init/provider/state_provider.dart';
import 'package:secim2023_mv_app/testino.dart';
import 'package:secim2023_mv_app/utility/horizontal_scroll.dart';
import 'package:secim2023_mv_app/view/deputy_info/deputy_info_main.dart';
import 'package:secim2023_mv_app/view/main_view.dart';
import 'package:secim2023_mv_app/view/turkey_map.dart';

Future<void> main() async {
  await Constants().firebaseConstants;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => StateProvider(),
      ),
    ],
    child: const AppHandler(),
  ));
}

class AppHandler extends StatelessWidget {
  const AppHandler({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: '2023 Milletvekilleri Aday Portalı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
    );
  }
}
