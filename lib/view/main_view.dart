import 'dart:math';
import 'dart:ui';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:provider/provider.dart';
import 'package:responsive_spacing/extensions/scaled_size_extension.dart';
import 'package:responsive_spacing/widgets/spacing.dart';
import 'package:secim2023_mv_app/core/constants/constants.dart';
import 'package:secim2023_mv_app/core/init/provider/state_provider.dart';
import 'package:secim2023_mv_app/view/state_info/state_info.dart';
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

  final mapSelectedStateWidget = [
    Container(
      height: 1,
      width: 1,
      color: Colors.transparent,
    ),
    DelayedDisplay(delay: Duration(milliseconds: 250), child: StateInfo())
  ];

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
                  height: screenHeight * 2,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFF69C0FF), Color(0xFF0E6FA6)]))),
              CircularBackgroundBackdrop(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              MaskedTopographWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  spinAnimationController: _spinAnimationController),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: Spacing.of(context).padding.allEdgeInsets * 3,
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.3,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.15,
                            child: Center(
                              child: Text(
                                "Cumhurbaşkanı ve 28. Dönem Milletvekili Genel Seçimi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22 * fontSizeFactor,
                                ),
                              ),
                            ),
                          ),
                          TimerCountdown(
                            format:
                                CountDownTimerFormat.daysHoursMinutesSeconds,
                            timeTextStyle: TextStyle(color: Colors.white),
                            descriptionTextStyle:
                                TextStyle(color: Colors.white),
                            colonsTextStyle: TextStyle(color: Colors.white),
                            daysDescription: "Gün",
                            hoursDescription: "Saat",
                            minutesDescription: "Dakika",
                            secondsDescription: "Saniye",
                            endTime: DateTime.parse("2023-05-14 08:00:00"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: Spacing.of(context).padding.allEdgeInsets * 3,
                child: Row(
                  children: [
                    BallotBox(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        floatingAnimationController:
                            _floatingAnimationController,
                        floatingAnimation: _floatingAnimation),
                    WelcomeTitle(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        fontSizeFactor: fontSizeFactor),
                  ],
                ),
              ),
              Container(
                height: screenHeight * 2,
                width: screenWidth,
                child: Column(
                  children: [
                    //Used as a spacer
                    Container(
                      height: screenHeight * 1.3,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Consumer<StateProvider>(
                          builder: (context, provider, state) {
                            return Container(
                              height: screenHeight * 0.6,
                              width: screenWidth * 0.9,
                              child: Stack(
                                children: [
                                  Center(child: TurkeyMap()),
                                  Center(
                                    child: Container(
                                      height: screenHeight * 0.45,
                                      width: screenWidth * 0.5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Lütfen görüntülemek istediğiniz ili seçin",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                        height: screenHeight * 0.2,
                                        width: screenWidth * 0.15,
                                        child: Center(
                                            child: mapSelectedStateWidget[
                                                provider
                                                    .mapStateWidgetStatus])),
                                  ),
                                  Center(
                                    child: Container(
                                      height: screenHeight * 0.45,
                                      width: screenWidth * 0.5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "Yeni il bilgileri eklenmeye devam etmektedir.",
                                            style:
                                                TextStyle(color: Colors.yellow),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.2,
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
                                          fontSize: 24, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: PartyCarousel(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      carouselController: _carouselController),
                                )
                              ],
                            ),
                          )),
                    ),
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

class PartyCarousel extends StatelessWidget {
  const PartyCarousel({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required InfiniteScrollController carouselController,
  }) : _carouselController = carouselController;

  final double screenHeight;
  final double screenWidth;
  final InfiniteScrollController _carouselController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.14,
      width: screenWidth,
      decoration: BoxDecoration(
          color: Color(0xFFC0EEF2).withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
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
        itemBuilder: (context, itemIndex, realIndex) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 100,
              width: 100,
              child:
                  Image.network(PartyLogos().networkLogos.elementAt(itemIndex)),
            ),
          );
        },
      ),
    );
  }
}
