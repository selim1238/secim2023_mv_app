class PartyLogos {
  List<String> networkLogos = [
    "https://upload.wikimedia.org/wikipedia/tr/f/fb/Millet_Partisi.png",
    "https://upload.wikimedia.org/wikipedia/tr/7/73/Hak_ve_%C3%B6zg%C3%BCrl%C3%BCkler_partisi_logo.jpg",
    "https://upload.wikimedia.org/wikipedia/tr/c/c7/Tkp.png",
    "https://upload.wikimedia.org/wikipedia/commons/5/55/T%C3%BCrkiye_Kom%C3%BCnist_Hareketi_Amblemi.png",
    "https://upload.wikimedia.org/wikipedia/commons/9/93/Sol_Parti_logo.png",
    "https://static.wixstatic.com/media/9b780c_30d2e97aa47a4ac2bc086a87cad92ce0~mv2.png/v1/fill/w_458,h_330,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/9b780c_30d2e97aa47a4ac2bc086a87cad92ce0~mv2.png",
    "https://upload.wikimedia.org/wikipedia/tr/d/d1/Memleket_Partisi_logo.png",
    "https://upload.wikimedia.org/wikipedia/tr/7/7c/B%C3%BCy%C3%BCk_Birlik_Partisi_logo.png",
    "https://upload.wikimedia.org/wikipedia/tr/d/d5/Adalet_ve_Kalk%C4%B1nma_Partisi_logo.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Refah_Partisi_logo.svg/1200px-Refah_Partisi_logo.svg.png",
    "https://upload.wikimedia.org/wikipedia/commons/9/99/MHP_logo_Turkey.png",
    "https://upload.wikimedia.org/wikipedia/commons/f/fc/Ye%C5%9Fil_Sol_Parti_logo.png",
    "https://static.wixstatic.com/media/8d5d4e_ff959d3db95449e09a153afe714e5e32~mv2.png/v1/fit/w_1024,h_1025,al_c,q_80,enc_auto/file.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Independent_Turkey_Party_Logo.svg/1200px-Independent_Turkey_Party_Logo.svg.png",
    "https://upload.wikimedia.org/wikipedia/tr/e/e1/AdaletBirlikPartisi.png",
    "https://upload.wikimedia.org/wikipedia/tr/4/4a/Anap_logo.png",
    "https://upload.wikimedia.org/wikipedia/tr/f/fa/Yenilik_Partisi.png",
    "https://upload.wikimedia.org/wikipedia/commons/3/3b/HKP_logo.png",
    "https://upload.wikimedia.org/wikipedia/tr/0/07/Milli_Yol_Partisi.jpg",
    "https://upload.wikimedia.org/wikipedia/tr/1/16/Vatanpartisilogo.png",
    "https://upload.wikimedia.org/wikipedia/tr/thumb/6/64/G%C3%BC%C3%A7Birli%C4%9FiPartisi.png/160px-G%C3%BC%C3%A7Birli%C4%9FiPartisi.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Cumhuriyet_Halk_Partisi_Logo.svg/862px-Cumhuriyet_Halk_Partisi_Logo.svg.png",
    "https://static.wixstatic.com/media/18e2fa_f457de9a8a01426790a8a120c5d5a86a~mv2.png/v1/fill/w_216,h_217,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/bu-kadrolar-ile-iyi-parti-yikilmaz.png",
    "https://upload.wikimedia.org/wikipedia/tr/2/27/Adalet-partisi-logo.png",
    "https://upload.wikimedia.org/wikipedia/tr/9/96/Zafer_Partisi_Logo.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Independent_Turkey_Party_Logo.svg/1200px-Independent_Turkey_Party_Logo.svg.png",
  ];
}

class PartyClass {
  final String partyName;
  final String partyLogo;

  PartyClass(this.partyName, this.partyLogo);
}

class PartyNameToLogo {
  static final AKP = PartyClass("Adalet ve Kalkınma Partisi",
      "https://upload.wikimedia.org/wikipedia/tr/d/d5/Adalet_ve_Kalk%C4%B1nma_Partisi_logo.png");
  static final CHP = PartyClass("Cumhuriyet Halk Partisi",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Cumhuriyet_Halk_Partisi_Logo.svg/862px-Cumhuriyet_Halk_Partisi_Logo.svg.png");
  static final MHP = PartyClass("Milliyetçi Hareket Partisi",
      "https://upload.wikimedia.org/wikipedia/commons/9/99/MHP_logo_Turkey.png");
  static final IYI = PartyClass("IYI Parti",
      "https://static.wixstatic.com/media/18e2fa_f457de9a8a01426790a8a120c5d5a86a~mv2.png/v1/fill/w_216,h_217,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/bu-kadrolar-ile-iyi-parti-yikilmaz.png");

  static final MEMLEKET = PartyClass("Memleket Partisi",
      "https://upload.wikimedia.org/wikipedia/tr/d/d1/Memleket_Partisi_logo.png");
  static final TIP = PartyClass("Türkiye İşçi Partisi",
      "https://static.wixstatic.com/media/8d5d4e_ff959d3db95449e09a153afe714e5e32~mv2.png/v1/fit/w_1024,h_1025,al_c,q_80,enc_auto/file.png");
  static final YSP = PartyClass("Yeşil Sol Parti",
      "https://upload.wikimedia.org/wikipedia/commons/f/fc/Ye%C5%9Fil_Sol_Parti_logo.png");
  static PartyClass getLogoUrl(String partyName) {
    switch (partyName) {
      case "AKP":
        return AKP;
      case "CHP":
        return CHP;
      case "MHP":
        return MHP;
      case "IYI":
        return IYI;
      case "MEMLEKET":
        return MEMLEKET;
      case "TIP":
        return TIP;
      case "YSP":
        return YSP;
      default:
        throw Exception("Invalid party name");
    }
  }
}
