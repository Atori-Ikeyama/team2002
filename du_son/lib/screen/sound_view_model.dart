import 'package:du_son/models/sound_model.dart';
import 'package:du_son/util/calculate.dart';
import 'package:du_son/util/device_info.dart';
import 'package:flutter/material.dart';

class SoundManager with ChangeNotifier {
  SoundModel model = SoundModel();
  DeviceInfo _deviceInfo = DeviceInfo();
  Calculate _calculate = Calculate();
  List<Map<String, dynamic>> _sounds = [
    {'location': {
      'latitude': 123.456,
      'longitude': 123.456,
      'fileName': 'cafe.mp3'}
    },
    {
      'location': {
        'latitude':,

      }
    }
  ];

  List<SoundModel> sound_positions;


}