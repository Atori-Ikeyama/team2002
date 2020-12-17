import 'package:du_son/models/sound_model.dart';
import 'package:du_son/util/calculate.dart';
import 'package:du_son/util/device_info.dart';
import 'package:flutter/material.dart';

class SoundManager with ChangeNotifier {
  SoundModel model = SoundModel();
  DeviceInfo _deviceInfo = DeviceInfo();
  Calculate _calculate = Calculate();
  final String documentId =
}