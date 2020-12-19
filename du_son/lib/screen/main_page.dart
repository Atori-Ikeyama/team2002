import 'package:flutter/material.dart';

import 'package:du_son/screen/google_maps_view.dart';
import 'package:du_son/screen/map_decorate_view.dart';
import 'package:du_son/screen/sound_view.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          GoogleMaps(),
          MapDecorate(),
          SoundsScreen(),
        ],
      ),
    );
  }
}
