import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:secim2023_mv_app/core/constants/party_logos.dart';

import '../../main_excel.dart';
import 'deputy_card_styler.dart';
import 'package:url_launcher/url_launcher.dart';

class DeputyInfoMain extends StatefulWidget {
  const DeputyInfoMain(
      {super.key, required this.areaName, required this.areaDb});
  final String areaName;
  final String areaDb;
  @override
  State<DeputyInfoMain> createState() => _DeputyInfoMainState();
}

class _DeputyInfoMainState extends State<DeputyInfoMain> {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Sayfa Açılamadı $url';
    }
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF181823).withOpacity(0.9),
        toolbarHeight: screenHeight * 0.075,
        actions: [
          InkWell(
            onTap: () {
              MilletvekiliInit().readExcel();
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text("Önceki dönem sonuçları",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text(widget.areaName + " 28. Dönem Milletvekili Adayları"),
      ),
      body: Stack(
        children: [
          Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF69C0FF), Color(0xFF0E6FA6)]))),
          FutureBuilder<List<String>>(
              future: MilletvekiliInit().getStateParties(widget.areaDb),
              builder: (context, partyCounterSnapshot) {
                var partyCountLength = partyCounterSnapshot.data;
                if (partyCounterSnapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: partyCountLength!.length,
                      itemBuilder: (context, partyIndex) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: screenHeight * 0.05,
                                  width: screenWidth * 0.2,
                                  child: Row(children: [
                                    Container(
                                      height: screenWidth * 0.05,
                                      width: screenWidth * 0.05,
                                      child: Image.network(
                                          PartyNameToLogo.getLogoUrl(
                                                  partyCounterSnapshot
                                                      .data![partyIndex])
                                              .partyLogo),
                                    ),
                                    Text(
                                        PartyNameToLogo.getLogoUrl(
                                                partyCounterSnapshot
                                                    .data![partyIndex])
                                            .partyName,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ]),
                                ),
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.35,
                              width: screenWidth,
                              child: FutureBuilder<List<Map<String, dynamic>>>(
                                  future: MilletvekiliInit()
                                      .getStatePartyDeputies(
                                          widget.areaDb,
                                          partyCounterSnapshot
                                              .data![partyIndex]),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return AnimationLimiter(
                                        child: ListView.builder(
                                            controller: scrollController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              return AnimationConfiguration
                                                  .staggeredList(
                                                position: index,
                                                duration:
                                                    const Duration(seconds: 1),
                                                child: SlideAnimation(
                                                  verticalOffset: 50.0,
                                                  child: FadeInAnimation(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        height:
                                                            screenHeight * 0.25,
                                                        width:
                                                            screenWidth * 0.1,
                                                        decoration: BoxDecoration(
                                                            gradient: DeputyCardStyler()
                                                                .getPartyGradient(
                                                                    snapshot.data![
                                                                            index]
                                                                        [
                                                                        "party"]),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Column(
                                                            children: [
                                                              Center(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          5.0),
                                                                  child: Container(
                                                                      height: screenHeight * 0.15,
                                                                      width: screenWidth * 0.075,
                                                                      decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child: ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        child:
                                                                            FadeInImage(
                                                                          image:
                                                                              Image.network(snapshot.data![index]["photoUrl"]).image,
                                                                          imageErrorBuilder: (context,
                                                                              error,
                                                                              stackTrace) {
                                                                            print(error);
                                                                            return Image.asset("assets/Loading.gif");
                                                                          },
                                                                          placeholder:
                                                                              AssetImage("assets/Loading.gif"),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      )),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        2.0),
                                                                child: Text(
                                                                  "( " +
                                                                      snapshot.data![
                                                                              index]
                                                                          [
                                                                          "party"] +
                                                                      " )",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 5),
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      screenHeight *
                                                                          0.05,
                                                                  width:
                                                                      screenWidth *
                                                                          0.098,
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                              0xFF5C8EBC)
                                                                          .withOpacity(
                                                                              0.5),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Color(0xFF5C8EBC).withOpacity(0.5),
                                                                          spreadRadius:
                                                                              1,
                                                                          blurStyle:
                                                                              BlurStyle.outer,
                                                                          blurRadius:
                                                                              3,
                                                                        ),
                                                                      ]),
                                                                  child: Center(
                                                                    child: Text(
                                                                        snapshot.data![index]["name"] +
                                                                            " " +
                                                                            snapshot.data![index][
                                                                                "surname"],
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Center(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          4.0),
                                                                  child: Text(
                                                                    snapshot.data![
                                                                            index]
                                                                        [
                                                                        "info"],
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomLeft,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        _launchURL(snapshot.data![index]
                                                                            [
                                                                            "source"]);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "Hakkında daha Fazla Bilgi",
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                0,
                                                                                25,
                                                                                250),
                                                                            fontSize:
                                                                                10),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("Hata: ${snapshot.error}");
                                    } else {
                                      return Center(
                                        child: Container(
                                            height: 150,
                                            width: 150,
                                            child: CircularProgressIndicator()),
                                      );
                                    }
                                  }),
                            ),
                          ],
                        );
                      });
                } else if (partyCounterSnapshot.hasError) {
                  return Text("Hata: ${partyCounterSnapshot.error}");
                } else {
                  return Center(
                    child: Container(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator()),
                  );
                }
              })
        ],
      ),
    );
  }
}
