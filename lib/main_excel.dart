import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

class MilletVekili {
  dynamic name = "";
  dynamic surname = "";
  dynamic party = "";
  dynamic photoUrl = "";
  dynamic info = "";
  dynamic source = "";

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
  final List<MilletVekili> items = [];

  void readExcel() async {
    ByteData data = await rootBundle.load('assets/DUZCE_AKP.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        if (row[0]!.value.toString() != "name") {
          items.add(MilletVekili(
              row[0]?.value == null ? "" : row[0]!.value.toString(),
              row[1]?.value == null ? "" : row[1]!.value.toString(),
              row[2]?.value == null ? "" : row[2]!.value.toString(),
              row[3]?.value == null ? "" : row[3]!.value.toString(),
              row[4]?.value == null ? "" : row[4]!.value.toString(),
              row[5]?.value == null ? "" : row[5]!.value.toString()));
        }
      }
    }
    saveToFirestore();
  }

  //Debugging
  Future<void> saveToFirestore() async {
    final List<Map<String, dynamic>> itemList = items
        .map((item) => {
              'name': item.name,
              'surname': item.surname,
              "party": item.party,
              "photoUrl": item.photoUrl,
              "info": item.info,
              "source": item.source,
            })
        .toList();

    try {
      await _db
          .collection('MVDB')
          .doc("DUZCE")
          .collection("AKP")
          .doc("Milletvekilleri")
          .set({
        'items': itemList,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
