import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_compass/flutter_compass.dart';

class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  LocationData currentLocation;
  GoogleMapController mapController;

  Location _locationService = new Location();
  String error;
  double angle = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _locationService.onLocationChanged.listen((LocationData result) async {
      setState(() {
        log(currentLocation.longitude.toString());
        currentLocation = result;
        cameraPosition();
      });
    });

    FlutterCompass.events.listen((value) async {
      setState(() {
        angle = value.heading;
        cameraPosition();
      });
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    // _controller.complete(controller);
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              // 最初のカメラ位置
              target:
                  LatLng(currentLocation.latitude, currentLocation.longitude),
              zoom: 19.0,
              bearing: angle,
            ),
            myLocationEnabled: false,
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            liteModeEnabled: false,
            tiltGesturesEnabled: false,
            myLocationButtonEnabled: false,
          ),
        ),
      );
    }
  }

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
    setState(() {
      currentLocation = myLocation;
    });
  }

  void cameraPosition() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      bearing: angle,
      zoom: 19.0,
    )));
  }
}
