import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/custom_colors.dart';
import '../../core/init/provider/state_provider.dart';
import '../deputy_info/deputy_info_main.dart';

class AreaDeputiesHandler extends StatelessWidget {
  const AreaDeputiesHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (context, provider, state) {
        return Padding(
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
                  color: CustomColors().customBackgroundColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text("Milletvekillerini Gör",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class IstanbulDeputiesHandler extends StatelessWidget {
  const IstanbulDeputiesHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (context, provider, state) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity,
                            areaDb: "ISTANBUL1")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.04,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("1. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity,
                            areaDb: "ISTANBUL2")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.04,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("2. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity,
                            areaDb: "ISTANBUL3")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.04,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("3. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AnkaraDeputiesHandler extends StatelessWidget {
  const AnkaraDeputiesHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (context, provider, state) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity,
                            areaDb: "ANKARA1")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.04,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("1. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity,
                            areaDb: "ANKARA2")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.04,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("2. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity,
                            areaDb: "ANKARA3")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.04,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("3. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class IzmirDeputiesHandler extends StatelessWidget {
  const IzmirDeputiesHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (context, provider, state) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity, areaDb: "IZMIR1")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.06,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("1. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity, areaDb: "IZMIR2")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.06,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("2. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BursaDeputiesHandler extends StatelessWidget {
  const BursaDeputiesHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (context, provider, state) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity, areaDb: "BURSA1")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.06,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("1. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeputyInfoMain(
                            areaName: provider.selectedCity, areaDb: "BURSA2")),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.06,
                  decoration: BoxDecoration(
                      color:
                          CustomColors().customBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("2. Bölge",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
