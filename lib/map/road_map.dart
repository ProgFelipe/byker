import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'recorder.dart';

class RoadMap extends StatefulWidget {
  const RoadMap({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return RoadMapState();
  }
}

class RoadMapState extends State<RoadMap> {
  List<Position> locations = [];

  var _cIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Maper(),
          Visibility(
            visible: _cIndex == 1,
            child: Recorder(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () => setState(() {
          _cIndex = _cIndex != 1 ? 1 : 0;
        }),
        child: _cIndex != 1
            ? Icon(
                Icons.radio_button_checked,
              )
            : Icon(Icons.map),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
    /*Column(
      children: <Widget>[
        ListView(
          children: locations
              .map((loc) => ListTile(
                    title: Text(
                        "lat: ${loc.latitude}, log: ${loc.longitude}, alt: ${loc.altitude}"),
                  ))
              .toList(),
        )
      ],
    );*/
  }
}

class Maper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MaperState();
  }
}

class MaperState extends State<Maper> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController controller;
  LatLng _center = const LatLng(4.5877232, -83.3923411);
  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
    _controller.complete(controller);
  }

  var locationEnabled = false;

  void _onLocationEnables() async {
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    setState(() {
      if (geolocationStatus.value == GeolocationStatus.granted.value) {
        locationEnabled = true;
        print("Granted");
      } else {
        locationEnabled = false;
        print("Not Granted");
      }
    });
  }

  @override
  void initState() {
    //_checkPermissions();
    _onLocationEnables();
    var location = new Location();
    location.onLocationChanged().listen((LocationData currentLocation) {
      if (controller != null && locationEnabled) {
        _center = LatLng(currentLocation.latitude, currentLocation.longitude);
        //controller.animateCamera(CameraUpdate.newCameraPosition(
          //  CameraPosition(target: _center, zoom: 10)));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 20.0,
      ),
      myLocationEnabled: true,
    );
  }
}
