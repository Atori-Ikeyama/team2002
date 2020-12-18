import 'package:du_son/models/map_decorate_model.dart';
import 'package:du_son/models/sound_model.dart';
import 'package:du_son/util/calculate.dart';
import 'package:du_son/util/device_info.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter/material.dart';

class MapDecorateManager with ChangeNotifier {
  MapDecorateModel model = MapDecorateModel();
  Calculate calculate;

  MapDecorateManager(Size size){
    calculate = Calculate(size);

    FlutterCompass.events.listen((value) async {
      model.angle = value.heading;
      model.beginEnd = calculate.solarAzimuth(
          model.angle,
          size.width,
          size.height,
      );
      notifyListeners();
    });
  }
}