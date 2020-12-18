import 'package:du_son/models/sound_model.dart';
import 'package:du_son/util/calculate.dart';
import 'package:du_son/util/device_info.dart';
import 'package:flutter/material.dart';

class SoundManager with ChangeNotifier {
  SoundModel model = SoundModel();
  DeviceInfo _deviceInfo = DeviceInfo();
  Calculate _calculate = Calculate();
  List<Map<String, dynamic>> _sounds = [
    {'kigaku': {
      'latitude': 123.456,
      'longitude': 123.456,
      'path': 'asafdasfasfsa'}
    }
  ];

  List<SoundModel> sound_positions;


}