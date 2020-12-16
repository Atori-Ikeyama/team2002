import 'package:du_son/models/map_decorate_model.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter/material.dart';

class MapDecorateManager with ChangeNotifier {
  MapDecorateModel model = MapDecorateModel();

  MapDecorateManager(){
    FlutterCompass.events.listen((value) async {
      model.angle = value.heading;
      notifyListeners();
    });
  }
}