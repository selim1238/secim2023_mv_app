import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:provider/provider.dart';
import 'package:responsive_spacing/extensions/scaled_size_extension.dart';
import 'package:responsive_spacing/widgets/spacing.dart';
import 'package:secim2023_mv_app/core/init/provider/state_provider.dart';
import 'package:secim2023_mv_app/view/turkey_map.dart';
import '../core/constants/party_logos.dart';
import '../core/db_init/db_init.dart';
import '../main_excel.dart';
import "./elements/masked_topograph.dart";
import "./elements/circular_backdrop.dart";
import "./elements/ballot_box.dart";
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'elements/welcome_titles.dart';
import "../main_excel.dart";

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late AnimationController _spinAnimationController;
  late AnimationController _floatingAnimationController;
  late Animation<Offset> _floatingAnimation;
  late ScrollController _scrollController;
  late String selectedCity = "";

  final _carouselController = InfiniteScrollController();
  final _animationDuration = Duration(seconds: 10);
  late AnimationController _animationController;

  //Reads excel data with excel package

  //create a function that reads excel data and saves it to firestore

  @override
  void initState() {
    _scrollController = ScrollController();
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
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    _animationController.repeat();
    _animationController.addListener(() {
      _carouselController.animateTo(
        _carouselController.offset + 120,
        duration: Duration(milliseconds: 6000),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var fontSizeFactor = (screenWidth + screenHeight) / 2000;
    return Scaffold(
      backgroundColor: Colors.white,
      body: WebSmoothScroll(
        controller: _scrollController,
        scrollOffset: 100,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
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
              CircularBackgroundBackdrop(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              MaskedTopographWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  spinAnimationController: _spinAnimationController),
              Padding(
                padding: Spacing.of(context).padding.allEdgeInsets * 3,
                child: Container(
                  width: screenWidth * 0.250,
                  height: screenHeight * 0.075,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Seçim 2023",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22 * fontSizeFactor,
                              fontWeight: FontWeight.w600),
                        ),
                        TimerCountdown(
                          format: CountDownTimerFormat.daysHoursMinutesSeconds,
                          timeTextStyle: TextStyle(color: Colors.white),
                          descriptionTextStyle: TextStyle(color: Colors.white),
                          colonsTextStyle: TextStyle(color: Colors.white),
                          daysDescription: "Gün",
                          hoursDescription: "Saat",
                          minutesDescription: "Dakika",
                          secondsDescription: "Saniye",
                          endTime: DateTime.parse("2023-05-14 08:00:00"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: Spacing.of(context).padding.allEdgeInsets * 3,
                  child: InkWell(
                    onTap: () {
                      // MilletvekiliInit().saveToFirestore();
                      MilletvekiliInit().readExcel();
                    },
                    child: Container(
                      width: screenWidth * 0.125,
                      height: screenHeight * 0.075,
                      child: Center(
                        child: Container(
                          width: screenWidth * 0.10,
                          height: screenHeight * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          child: Center(
                            child: Text(
                              "Form Gönder",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 102, 0),
                                fontSize: 16 * fontSizeFactor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              BallotBox(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  floatingAnimationController: _floatingAnimationController,
                  floatingAnimation: _floatingAnimation),
              Welcome_title1(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  fontSizeFactor: fontSizeFactor),
              Welcome_title2(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  fontSizeFactor: fontSizeFactor),
              Container(
                height: screenHeight * 3,
                width: screenWidth,
                child: Column(
                  children: [
                    //Used as a spacer
                    Container(
                      height: screenHeight * 1.05,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: screenHeight * 0.2,
                            width: screenWidth,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                      "OY PUSULASINDA YER ALACAK PARTİLER",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.orange)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Container(
                                    height: screenHeight * 0.14,
                                    width: screenWidth,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)
                                                .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InfiniteCarousel.builder(
                                      controller: _carouselController,
                                      itemCount: 26,
                                      itemExtent: 120,
                                      center: true,
                                      anchor: 0.8,
                                      velocityFactor: 0.5,
                                      onIndexChanged: (index) {},
                                      axisDirection: Axis.horizontal,
                                      loop: true,
                                      itemBuilder:
                                          (context, itemIndex, realIndex) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(PartyLogos()
                                                .networkLogos
                                                .elementAt(itemIndex)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    Container(
                      height: screenHeight * 0.1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.625,
                          child: Center(child: CityNameWidget()),
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: screenHeight * 0.4,
                          width: screenWidth * 0.6,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1),
                            child: TurkeyMap(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CityNameWidget extends StatelessWidget {
  const CityNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (context, provider, state) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Text(
              provider.selectedCity,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 115, 0), fontSize: 38),
            ),
          ),
        );
      },
    );
  }
}
