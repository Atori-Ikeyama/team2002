import 'package:du_son/models/map_decorate_model.dart';
import 'package:du_son/util/calculate.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter/material.dart';

class MapDecorateManager with ChangeNotifier {
  MapDecorateModel model = MapDecorateModel();
  Calculate calculate = Calculate();

  MapDecorateManager(){
    FlutterCompass.events.listen((value) async {
      model.angle = value.heading;
      model.beginEnd = calculate.solarAzimuth(model.angle);
      notifyListeners();
    });
  }
}