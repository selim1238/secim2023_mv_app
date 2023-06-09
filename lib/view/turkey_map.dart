import 'package:flutter/material.dart';
import 'package:interactable_svg/interactable_svg/src/models/region.dart';
import 'package:interactable_svg/interactable_svg/src/widgets/interactable_svg.dart';
import 'package:provider/provider.dart';
import 'package:secim2023_mv_app/core/init/provider/state_provider.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:city_picker_from_map/city_picker_from_map.dart';

class TurkeyMap extends StatefulWidget {
  const TurkeyMap({
    super.key,
  });

  @override
  State<TurkeyMap> createState() => _TurkeyMapState();
}

final GlobalKey<InteractableSvgState> mapKey = GlobalKey();

class _TurkeyMapState extends State<TurkeyMap> {
  City? selectedCity;
  final GlobalKey<CityPickerMapState> _mapKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CityPickerMap(
      key: _mapKey,
      width: double.infinity,
      height: double.infinity,
      map: Maps.TURKEY,
      onChanged: (city) {
        setState(() {
          var provider = Provider.of<StateProvider>(context, listen: false);
          provider.changeSelectedCity(int.parse(city!.id.split('-')[1]));
        });
      },
      dotColor: Colors.transparent,
      selectedColor: Color.fromARGB(255, 255, 115, 0),
      strokeColor: Color.fromARGB(255, 255, 115, 0),
    );
  }
}
