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

class MilletvekiliInits {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

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
          .doc("Adana")
          .collection("AKP")
          .doc("Milletvekilleri")
          .set({
        'items': itemList,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  final List<MilletVekili> items = [
    MilletVekili(
        "Ömer",
        "Çelik",
        "AKP",
        "https://pbs.twimg.com/profile_images/1622205137560150016/I3wjkXeQ_400x400.jpg",
        "Eski Türkiye Cumhuriyeti Kültür ve Turizm Bakanı",
        "https://tr.wikipedia.org/wiki/%C3%96mer_%C3%87elik"),
    MilletVekili(
        "Ahmet",
        "Zenbilci",
        "AKP",
        "https://admin.biyografya.com/_docs/photos/1888775aef75eef0c110f86b085073ec.jpg",
        "Türkiye Büyük Millet Meclisi Üyesi - 2018",
        "https://tr.wikipedia.org/wiki/Ahmet_Zenbilci"),
    MilletVekili(
        "Sunay",
        "Karamık",
        "AKP",
        "https://m.bianet.org/system/uploads/1/articles/spot_image/000/170/224/original/510.jpg",
        "AK PARTİ MKYK ÜYESİ",
        "https://www.aydinpost.com/sunay-karamik-kimdir-sunay-karamik-nereli-kac-yasinda-ak-parti-mkyk-isim-listesi-belli-oldu"),
    MilletVekili(
        "Abdullah",
        "Doğru",
        "AKP",
        "https://i.tmgrup.com.tr/secim/24-haziran-2018-secim-sonuclari/img/adaylar/2/1527149292.jpg",
        "Türkiye Büyük Millet Meclisi Üyesi - 2018",
        "https://tr.wikipedia.org/wiki/Abdullah_Do%C4%9Fru"),
    MilletVekili(
        "Faruk",
        "Aytek",
        "AKP",
        "https://www.akib.org.tr/files/documents/2021/Resimler/3%20faruk%20aytek.JPG?scale=both&width=300&height=402&mode=crop&anchor=middlecenter",
        "Adana il yönetim kurulu üyesi.",
        "https://www.akparti.org.tr/ak-kadro/il-yonetim-kurulu-uyeleri/adana?577177/Siyasi-ve-Hukuki-%C4%B0%C5%9Fler-Ba%C5%9Fkan%C4%B1/Faruk-AYTEK"),
    MilletVekili(
        "Mustafa Yıldız",
        "Aytek",
        "AKP",
        "https://www.cukurovabarisgazetesi.net/images/haberler/resimler/2/24577.jpg",
        "AK Parti Gençlik Kolları Adana İl Başkanı.",
        "https://www.akparti.org.tr/genclikkollari/yonetim/%C4%B1l-baskanlari?13396/Adana/Mustafa-YILDIZ"),
    MilletVekili(
        "Hasan Hüseyin",
        "Kuşçu",
        "AKP",
        "https://pbs.twimg.com/profile_images/647148886805508096/nJRvRzee_400x400.jpg",
        "Ak Parti Seyhan İlçe Başkan Vekili",
        "https://twitter.com/HasanHseyinKuu1"),
    MilletVekili(
        "Erol",
        "Kahraman",
        "AKP",
        "https://pbs.twimg.com/profile_images/1093519312915185665/kbh3uKBu_400x400.jpg",
        "1999-2014 Sarımazı Belediye Başkanı Ekton A.Ş. Yönetim Kurulu Başkanı",
        "https://twitter.com/erolkahraman001"),
    MilletVekili(
        "Kasım",
        "Pamuk",
        "AKP",
        "https://pbs.twimg.com/profile_images/1061933409977688065/TUXQoKtN_400x400.jpg",
        "2019dan beri AK Parti Adana İl Başkan Yardımcılığı ve Seçim İşleri Başkanı",
        "https://www.akparti.org.tr/ak-kadro/il-yonetim-kurulu-uyeleri/adana?577181/Se%C3%A7im-%C4%B0%C5%9Fleri-Ba%C5%9Fkan%C4%B1/Kas%C4%B1m-PAMUK"),
    MilletVekili(
        "Fatima",
        "YurduSeven",
        "AKP",
        "https://pbs.twimg.com/profile_images/1638944845623353346/TPbeOtTS_400x400.jpg",
        "28.Dönem AK Parti Adana Milletvekili Adayı",
        "https://twitter.com/ftmyurduseven"),
    MilletVekili(
        "Dinçer",
        "Dinç",
        "AKP",
        "https://pbs.twimg.com/profile_images/1631288798708375564/yqW6dS3W_400x400.jpg",
        "Ziraat Mühendisi / AkParti il yönetim kurulu üyesi",
        "https://twitter.com/dincerdinc01?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor"),
    MilletVekili(
        "Melike",
        "Doğan",
        "AKP",
        "https://pbs.twimg.com/profile_images/1447575213483438082/ETDy7fHB_400x400.jpg",
        "Ak Parti Adana 28. Dönem Milletvekili Adayı, Adana Barosu Avukat Arabulucu",
        "https://twitter.com/AvMelikeDogan?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor"),
    MilletVekili(
        "Ramazan",
        "Çırak",
        "AKP",
        "https://im.haberturk.com/secim_aday/2018/adalet-ve-kalkinma-partisi-adana-ramazan-cirak-1008.jpg?v=15",
        "Avukat - Arabulucu",
        "https://twitter.com/ramazancrak"),
    MilletVekili(
        "Oğuzhan",
        "Gürhani",
        "AKP",
        "https://pbs.twimg.com/media/FtR1MmAXoAMSNap?format=jpg&name=medium",
        "Ç.Ü Genç Ofis Kurucu Sorumlusu",
        "https://twitter.com/oguzhangurhani1"),
    MilletVekili(
        "Mehmet",
        "Kurtaran",
        "AKP",
        "https://pbs.twimg.com/profile_images/1636631015677472768/Hse7Nr4Q_400x400.jpg",
        "Adana G.K İl Teşkilat Başkanı 2018-2020 İl Yönetim K. Üyesi",
        "https://twitter.com/mehmetkurtaran1?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor"),
  ];
}
