import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widget_mask/widget_mask.dart';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import '../core/db_init/db_init.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late AnimationController _spinAnimationController;
  late AnimationController _floatingAnimationController;
  late Animation<Offset> _floatingAnimation;
  late String selectedCity = "";

  //Reads excel data with excel package

  void readExcel() async {
    ByteData data = await rootBundle.load('assets/deneme_2.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table]!.maxCols);
      print(excel.tables[table]!.maxRows);
      for (var row in excel.tables[table]!.rows) {
        print(row[0]!.value);
        print(row[1]!.value);
        print(row[2]!.value);
      }
    }
  }

  //create a function that reads excel data and saves it to firestore

  @override
  void initState() {
    _spinAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 300))
          ..repeat();
    _floatingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    )..repeat(reverse: true);
    _floatingAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, 0.1),
    ).animate(CurvedAnimation(
      parent: _floatingAnimationController,
      curve: Curves.linear,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: screenHeight * 3,
              width: screenWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.white,
                Colors.blue,
              ], stops: [
                0.2,
                0.8
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            AnimatedPositioned(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: screenWidth * 1.5,
                width: screenWidth * 1.5,
                right: screenWidth * -0.1,
                top: screenWidth * -1.025,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(1500)),
                )),
            AnimatedPositioned(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: screenWidth * 1.5,
                width: screenWidth * 1.5,
                right: screenWidth * -0.1,
                top: screenWidth * -1.05,
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0)
                      .animate(_spinAnimationController),
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
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 25, 0, 0),
              child: Text(
                "Seçim 2023",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 50, 0),
                child: InkWell(
                  onTap: () {
                    // MilletvekiliInit().saveToFirestore();
                    readExcel();
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.6),
                    ),
                    child: Center(
                      child: Text(
                        "Form Gönder",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 102, 0),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: screenWidth * 0.4,
                width: screenWidth * 0.5,
                child: Center(
                  child: Container(
                    height: screenWidth * 0.25,
                    width: screenWidth * 0.25,
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
            Container(
                height: screenHeight * 0.7,
                width: screenWidth * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: screenWidth * 0.3,
                          child: Text(
                            "Açık Kaynak kodlu",
                            style:
                                TextStyle(fontSize: 35.0, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: screenWidth * 0.3,
                          child: Text(
                            "Kullanıcılar tarafından oluşturulmuş",
                            style:
                                TextStyle(fontSize: 35.0, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: screenWidth * 0.3,
                          child: Text(
                            "Milletvekili Aday Bilgi Portalı",
                            style:
                                TextStyle(fontSize: 35.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.3,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            'DOĞRU',
                            style:
                                TextStyle(fontSize: 43.0, color: Colors.white),
                          ),
                          const SizedBox(width: 20.0, height: 100.0),
                          DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 40.0,
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
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
