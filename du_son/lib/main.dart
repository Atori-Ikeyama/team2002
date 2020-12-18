import 'package:flutter/material.dart';
import 'package:du_son/screen/dependencies.dart';

import 'package:du_son/screen/main_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: DependenciesProvider(
        child: MainPage(),
      ),
  ));
}