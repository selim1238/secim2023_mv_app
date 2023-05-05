import 'package:flutter/material.dart';
import 'package:secim2023_mv_app/core/constants/cities.dart';

class StateProvider extends ChangeNotifier {
  String _selectedCity = "";
  String get selectedCity => _selectedCity;

  bool _isCitySelected = false;
  bool get isCitySelected => _isCitySelected;

  void changeSelectedCity(int city) {
    _selectedCity = TurkeyCities().cities.elementAt(city);
    _isCitySelected = true;
    notifyListeners();
  }
}
