import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'recorder.dart';

class RoadMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RoadMapState();
  }
}

class RoadMapState extends State<RoadMap> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController controller;
  LatLng _center = const LatLng(45.521563, -122.677433);
  List<Position> locations = [];
  StreamSubscription<Position> streamSubscription;
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
      //getCurrentLocation();
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
    _controller.complete(controller);
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
            //CameraPosition(target: _center, zoom: 10)));
      }
    });
    super.initState();
  }

  void getCurrentLocation() {
    /*var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);



    if (locationEnabled) {
      geolocator.getPositionStream(locationOptions).listen((Position position) {
        print(position == null
            ? 'Unknown'
            : position.latitude.toString() +
                ', ' +
                position.longitude.toString());
        setState(() {
          if (position != null) {
            _center = LatLng(position.latitude, position.longitude);
            locations.add(position);
          }
        });
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      myLocationEnabled: true,
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
