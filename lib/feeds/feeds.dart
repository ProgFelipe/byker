import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

const API_KEY = "AIzaSyCxAI5dx-_-DvIYp1kdIABum8iJwAdtbrE";

class Feeds extends StatelessWidget{
  

  @override
  Widget build(BuildContext context) {
    var position = Position(latitude: 19.1550318, longitude: -96.132319);
    List<Feed> feeds = [Feed(positions: [position], routeName: "Alpes"),
    Feed(positions: [position], routeName: "Rusia"),
    Feed(positions: [position], routeName: "Palmas")];
    // TODO: implement build
    return ListView(
      children: feeds.map((feed) => Card(child: 
      Image.network("https://maps.googleapis.com/maps/api/staticmap?center=${feed.positions[0].latitude},${feed.positions[0].longitude}&zoom=12&size=400x400&key=${API_KEY}"),)).toList(),
    );
  }
}

class Feed{
  final List<Position> positions;
  final String routeName;
  Feed({this.positions, this.routeName});
}