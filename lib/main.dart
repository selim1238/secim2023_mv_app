import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secim2023_mv_app/core/init/provider/state_provider.dart';
import 'package:secim2023_mv_app/view/main_view.dart';

Future<void> main() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBTM3I5BXeNjgnZgPahVgjRL0jSBA-5fCE",
          authDomain: "secim2023mv.firebaseapp.com",
          projectId: "secim2023mv",
          storageBucket: "secim2023mv.appspot.com",
          messagingSenderId: "506760179614",
          appId: "1:506760179614:web:395bf4cc66765eee03f08f"));
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
    );
  }
}
