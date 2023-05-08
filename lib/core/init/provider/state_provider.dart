import 'package:flutter/material.dart';
import 'package:secim2023_mv_app/core/constants/cities.dart';

class StateProvider extends ChangeNotifier {
  String _selectedCity = "";
  String _selectedCityDb = "";
  String get selectedCityDb => _selectedCityDb;
  String get selectedCity => _selectedCity;
  int _selectedCityDeputyCount = 0;
  int get selectedCityDeputyCount => _selectedCityDeputyCount;
  int _selectedCityAreaCount = 0;
  int get selectedCityAreaCount => _selectedCityAreaCount;

  bool _isCitySelected = false;
  bool get isCitySelected => _isCitySelected;

  int _mapStateWidgetStatus = 0;
  int get mapStateWidgetStatus => _mapStateWidgetStatus;

  void changeMapStateWidgetStatus(int status) {
    _mapStateWidgetStatus = status;
    notifyListeners();
  }

  void changeSelectedCity(int city) {
    _selectedCity = TurkeyCities().cities.elementAt(city).stateName;
    _selectedCityAreaCount = TurkeyCities().cities.elementAt(city).areaCount;
    _selectedCityDb = TurkeyCities().cities.elementAt(city).stateDbName;
    _selectedCityDeputyCount =
        TurkeyCities().cities.elementAt(city).deputyCount;
    _isCitySelected = true;
    print(_selectedCity);
    print(_selectedCityAreaCount);
    print(_selectedCityDb);
    notifyListeners();
  }
}
