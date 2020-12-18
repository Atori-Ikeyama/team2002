import 'package:du_son/models/sound_model.dart';
import 'package:du_son/util/calculate.dart';
import 'package:du_son/util/device_info.dart';
import 'package:flutter/material.dart';

class SoundManager with ChangeNotifier {
  SoundModel model = SoundModel();
  DeviceInfo _deviceInfo = DeviceInfo();
  Calculate _calculate = Calculate();
  List<Map<String, dynamic>> _sounds = [
<<<<<<< HEAD
    {'ABURI': {
      'latitude': 41.82684221155052,
      'longitude': 140.75185841416268,
      'path': 'ramen.mp3',}
    },

    {
    'seven': {
    'latitude': 41.82434780452737,
    'longitude': 140.7600123287547,
    'path': 'convenience_store.mp3'}
    },

    {
    'bread': {
    'latitude': 41.8261546603415,
    'longitude': 140.75681513587003,
    'path': 'microwave_oven.mp3'}
    },

    {
    'Beer_KAMADA': {
    'latitude': 41.82478724067343,
    'longitude': 140.76038459097285,
    'path': 'Beer.mp3'}
    },

    {
    'Cafe_KAEDE': {
    'latitude': 41.82495433204142,
    'longitude': 140.75559638890056,
    'path': 'cafe.mp3'}
    },

    {
    'KIRAKU': {
    'latitude': 41.817664237537535,
    'longitude': 140.74903878796607,
    'path': 'ramen.mp3'}
    },

    {
    'Scissors': {
    'latitude': 41.82631751237681,
    'longitude': 140.75572460000427,
    'path': 'Scissors.mp3'}
    },

    {
    'BBQ': {
    'latitude': 41.813906678195465,
    'longitude': 140.75314684611232,
    'path': 'BBQ_house.mp3'}
    },

    {
    'Cafe_en': {
    'latitude': 41.837005393152594,
    'longitude': 140.76468075479335,
    'path': 'coffee.mp3'}
    },

=======
    {'location': {
      'latitude': 123.456,
      'longitude': 123.456,
      'fileName': 'cafe.mp3'}
    },
    {
      'location': {
        'latitude':,

      }
>>>>>>> 44e69abf0e811fb2c113b1623eeb4eb8de48d54d
    }
  ];

  List<SoundModel> sound_positions;


}