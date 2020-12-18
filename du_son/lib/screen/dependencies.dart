import 'package:du_son/screen/map_decorate_view_model.dart';
import 'package:du_son/screen/sound_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DependenciesProvider extends StatelessWidget {
  final Widget child;
  DependenciesProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapDecorateManager>(
          create: (context) => MapDecorateManager(size),
        ),
        ChangeNotifierProvider<SoundManager>(
            create:(context) => SoundManager(size),
        )
      ],
      child: child,
    );
  }
}