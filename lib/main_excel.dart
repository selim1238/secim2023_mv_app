import 'dart:io';
import 'package:excel/excel.dart';

void readExcel() {
  // Excel dosyasını yükle
  var bytes = File('assets/deneme.xlsx').readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  // Tablo verilerine eriş
  var table = excel.tables['Sheet1'];
  var rows = table!.rows;

  // Verileri consola yazdır
  for (var row in rows) {
    print('${row[0]} - ${row[1]}');
  }
}
