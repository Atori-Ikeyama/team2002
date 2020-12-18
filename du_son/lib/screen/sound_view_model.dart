import 'package:du_son/models/sound_model.dart';
import 'package:du_son/util/calculate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:location/location.dart';

class SoundManager with ChangeNotifier {
  double _angle = 0;
  Calculate _calculate;
  List<SoundModel> sounds = [new SoundModel(41.8419230, 140.7703544, 'coffee.mp3'),];
  LocationData currentLocation;
  Location _locationService = Location();
  String error;

  void initPlatformState() async {
    LocationData myLocation;
    try {
      myLocation = await _locationService.getLocation();
      error = "";
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENITED')
        error = 'Permission denited';
      else if (e.code == 'PERMISSION_DENITED_NEVER_ASK')
        error =
            'Permission denited - please ask the user to enable it from the app settings';
      myLocation = null;
    }
    currentLocation = myLocation;
    notifyListeners();
  }

  SoundManager(Size size) {
    _calculate = Calculate(size);

    initPlatformState();
    _locationService.onLocationChanged.listen((LocationData result) async {
      currentLocation = result;
      sounds = _calculate.soundPosition(
          _angle, currentLocation.latitude, currentLocation.longitude, this._sounds);
      notifyListeners();
      print('sound_view_model: LocationService');
    });

    FlutterCompass.events.listen((value) async {
      _angle = value.heading;
      sounds = _calculate.soundPosition(
          _angle, currentLocation.latitude, currentLocation.longitude, this._sounds);
      notifyListeners();
      print('sound_view_model: FlutterCompass');
    });
  }

  List<Map<String, dynamic>> _sounds = [
    {
      'location': {
        'latitude': 41.82684221155052,
        'longitude': 140.75185841416268,
        'path': 'ramen.mp3',
      }
    },
    {
      'location': {
        'latitude': 41.82434780452737,
        'longitude': 140.7600123287547,
        'path': 'convenience_store.mp3'
      }
    },
    {
      'location': {
        'latitude': 41.8261546603415,
        'longitude': 140.75681513587003,
        'path': 'microwave_oven.mp3'
      }
    },
    {
      'location': {
        'latitude': 41.82478724067343,
        'longitude': 140.76038459097285,
        'path': 'Beer.mp3'
      }
    },
    {
      'location': {
        'latitude': 41.82495433204142,
        'longitude': 140.75559638890056,
        'path': 'cafe.mp3'
      }
    },
    {
      'location': {
        'latitude': 41.817664237537535,
        'longitude': 140.74903878796607,
        'path': 'ramen.mp3'
      }
    },
    {
      'location': {
        'latitude': 41.82631751237681,
        'longitude': 140.75572460000427,
        'path': 'Scissors.mp3'
      }
    },
    {
      'location': {
        'latitude': 41.813906678195465,
        'longitude': 140.75314684611232,
        'path': 'BBQ_house.mp3'
      }
    },
    {
      'location': {
        'latitude': 41.837005393152594,
        'longitude': 140.76468075479335,
        'path': 'coffee.mp3'
      }
    },
    {
      'location': {
        'latitude': 41.8419230,
        'longitude': 140.7703544,
        'path': 'coffee.mp3'
      }
    }
  ];
}
