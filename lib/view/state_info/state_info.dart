import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secim2023_mv_app/core/init/provider/state_provider.dart';
import 'package:secim2023_mv_app/view/deputy_info/deputy_info_main.dart';

import '../../core/constants/constants.dart';

class StateInfo extends StatefulWidget {
  const StateInfo({super.key});

  @override
  State<StateInfo> createState() => _StateInfoState();
}

class _StateInfoState extends State<StateInfo> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Consumer<StateProvider>(
      builder: (context, provider, state) {
        return AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0, 0),
              ),
            ],
            color: Colors.black.withOpacity(0.5),
          ),
          duration: Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Center(
                      child: Text(
                        provider.selectedCity,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Center(
                          child: InkWell(
                              onTap: () {
                                provider.changeMapStateWidgetStatus(0);
                              },
                              child: Icon(Icons.close, color: Colors.white))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColors()
                                .customBackgroundColor
                                .withOpacity(0.7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.group,
                                    color: CustomColors().customTextColor,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "Milletvekili sayısı",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              provider.selectedCityDeputyCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColors()
                                .customBackgroundColor
                                .withOpacity(0.7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.view_carousel,
                                    color: CustomColors().customTextColor,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "Bölge Sayısı",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              provider.selectedCityAreaCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeputyInfoMain(
                                areaName: provider.selectedCity,
                                areaDb: provider.selectedCityDb)),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                          color: CustomColors()
                              .customBackgroundColor
                              .withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text("Milletvekillerini Gör",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}