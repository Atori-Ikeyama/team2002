import 'dart:async';

import 'package:du_son/models/map_decorate_model.dart';
import 'package:du_son/util/calculate.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter/material.dart';

class MapDecorateManager with ChangeNotifier {
  MapDecorateModel model = MapDecorateModel(0.0, [0, 0.5, 0, -0.5]);
  Calculate calculate;
  double azimuth;
  List<Color> color = [
    Color.fromRGBO(0, 0, 0, 1.0),
    Color.fromRGBO(0, 0, 0, 1.0)
  ];
  DateTime now = new DateTime.now();

  List<double> list = [0, 0, 7];
  List<double> list2 = [202, 15, 100];

  MapDecorateManager(Size size) {
    calculate = Calculate(size);
    azimuth = (now.hour*60 + now.minute)/4 ;
    getMinute(now.minute, now.hour);

    FlutterCompass.events.listen((value) async {
      model.angle = value.heading + azimuth;
      model.beginEnd = calculate.solarAzimuth(
        model.angle,
        size.width,
        size.height,
      );
      print(model);
      notifyListeners();
    });

    Timer.periodic(
      Duration(seconds: 1),
      _setColor,
    );
  }

  void _setColor(Timer timer) {
    getMinute(now.minute, now.hour);
    print('map_decorate_view_model: getMinute');
    notifyListeners();
  }

  void getMinute(int minute, int hour) {
    int getTime = hour * 60 + minute;
    //0~4時
    if (getTime >= 0 && getTime < 240) {
      if (getTime / 1 == 0) {
        list[0] += 1;
      } else if (getTime / 16 == 0) {
        list[1] += 1;
      } else if (getTime / 3 == 0) {
        list[2] += 1;
        list2[1] += 1;
      }
      if (getTime / 20 == 0) {
        list2[0] -= 1;
      }
      //4~9時
    } else if (getTime >= 240 && getTime < 540) {
      if (getTime / 25 == 0) {
        list[0] -= 1;
      } else if (getTime / 4 == 0) {
        list[1] += 1;
      } else if (getTime / 7 == 0) {
        list2[0] += 1;
      }
      //9~16時
    } else if (getTime >= 540 && getTime < 960) {
      if (getTime / 10 == 0) {
        list[0] += 1;
      } else if (getTime / 6 == 0) {
        list2[0] += 1;
        list2[1] -= 1;
      }
      //16~17時くらい
    } else if (getTime >= 960 && getTime < 1030) {
      if (getTime / 1 == 0) {
        list[0] += 1;
        list[1] += 1;
        list2[0] -= 1;
        list2[1] += 1;
        list2[2] += 1;
      }
      //17くらい~18時半
    } else if (getTime >= 1030 && getTime < 1110) {
      if (getTime / 2 == 0) {
        list[0] -= 1;
        list[2] -= 1;
      } else if (getTime / 1 == 0) {
        list[1] += 1;
        list2[0] -= 3;
        list2[1] -= 1;
        list2[2] -= 1;
      }
      //18半~24時
    } else if (getTime >= 1110 && getTime < 1440) {
      if (getTime / 1 == 0) {
        list[0] -= 1;
        list2[0] += 1;
      } else if (getTime / 3 == 0) {
        list[1] -= 1;
        list2[2] += 1;
      } else if (getTime / 7 == 0) {
        list[2] -= 1;
      } else if (getTime / 22 == 0) {
        list2[1] += 1;
      }
    }

    HSVColor hsv = HSVColor.fromAHSV(1, list[0], list[1], list[2]);
    HSVColor hsv_af = HSVColor.fromAHSV(1, list2[0], list2[1], list2[2]);
    color[0] = hsv.toColor();
    color[1] = hsv_af.toColor();
  }
}

