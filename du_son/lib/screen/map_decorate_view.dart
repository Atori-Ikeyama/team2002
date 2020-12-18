import 'package:du_son/screen/map_decorate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapDecorate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapDecorateManager>(
      builder: (context, manager, _child) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(
              0,//manager.model.beginEnd[0],
              0, // manager.model.beginEnd[1],
            ),
            end: FractionalOffset(
              1, //manager.model.beginEnd[2],
              1, //manager.model.beginEnd[3],
            ),
            colors: [
              Colors.blueAccent.withOpacity(0.5), //manager.color[0].withOpacity(0.1),
              Colors.red.withOpacity(0.5),  //manager.color[1].withOpacity(0.1),
            ],
            stops: const [
              0.0,
              1.0,
            ],
          ),
        ),
      ),
    );
  }
}
