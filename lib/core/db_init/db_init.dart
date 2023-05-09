import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MilletVekili {
  String name = "";
  String surname = "";
  String party = "";
  String photoUrl = "";
  String info = "";
  String source = "";

  MilletVekili(
    this.name,
    this.surname,
    this.party,
    this.photoUrl,
    this.info,
    this.source,
  );
}

class MilletvekiliInit {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<String>> getStateParties(String city) async {
    List<String> parties = [];

    final collectionRef = FirebaseFirestore.instance
        .collection("MVDB")
        .doc(city)
        .collection("Milletvekilleri");

    final querySnapshot = await collectionRef.get();

    querySnapshot.docs.forEach((doc) {
      parties.add(doc.id);
    });
    print(parties);

    if (parties.isEmpty) {
      return Future.error("Parti bulunamadı");
    }
    return parties;
  }

  Future<List<Map<String, dynamic>>> getStatePartyDeputies(
      String city, String party) async {
    // Get docs from collection reference
    final docSnapshot = await FirebaseFirestore.instance
        .collection("MVDB")
        .doc(city)
        .collection("Milletvekilleri")
        .doc(party)
        .get();

    // Get data from docs and convert map to List
    final items = docSnapshot.data()?["items"] as List<dynamic>;
    final allData = items
        .map((doc) => {
              "name": doc["name"],
              "surname": doc["surname"],
              "info": doc["info"],
              "source": doc["source"],
              "party": doc["party"],
              "photoUrl": doc["photoUrl"]
            })
        .toList();

    return allData;
  }
}
