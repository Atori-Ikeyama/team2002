import 'package:du_son/screen/map_decorate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapDecorate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapDecorateManager>(
      builder: (context, manager, _child) => Container(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(
              manager.model.beginEnd[0],
              manager.model.beginEnd[1],
            ),
            end: FractionalOffset(
                manager.model.beginEnd[2],
                manager.model.beginEnd[3]
            ),
            colors: [
              manager.color[0].withOpacity(0.1),
              manager.color[1].withOpacity(0.1),
            ],
            stops: const [
              0.0,
              1.0,
            ],
          ),
        ),
      )),
    );
  }
}
