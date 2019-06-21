import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

const API_KEY = "AIzaSyCxAI5dx-_-DvIYp1kdIABum8iJwAdtbrE";

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var position = Position(latitude: 19.1550318, longitude: -96.132319);
    const BASE_Url = "https://maps.googleapis.com/maps/api/staticmap";
    List<Feed> feeds = [
      Feed(positions: [position], likes: 20, shareTimes: 4, user: User(iconUrl: "assets/images/helmeth1.png",), routeName: "Medellin - Filandia", fillGasTimes: 2, urlRoute: "assets/images/staticmap3.jpg", pictures: ["",""], spendTime: "4h 30m"),
      Feed(positions: [position], likes: 80, shareTimes: 100, user: User(iconUrl: "assets/images/helmeth2.png",) ,routeName: "Medellin - Cocorna", urlRoute: "assets/images/staticmap2.jpg", spendTime: "7h 45m"),
      Feed(positions: [position],likes: 1, shareTimes: 7, user: User(iconUrl: "assets/images/helmeth1.png",), routeName: "Medellin - Rio Claro", urlRoute: "assets/images/staticmap3.jpg", spendTime: "2h 30m")
    ];
    // TODO: implement build
    return ListView(
        children: feeds
            .map((feed) => Card(
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[CircleAvatar(
                        child: Image.asset("${feed.user.iconUrl}"),
                      ),
                      Text("${feed.routeName}", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold),),
                      ],mainAxisAlignment: MainAxisAlignment.spaceAround,),
                      Image.asset(
                        feed.urlRoute,
                        filterQuality: FilterQuality.medium,
                        fit: BoxFit.fitWidth,
                      ),
                      Row(children: <Widget>[
                        Padding(padding: new EdgeInsets.only(left: 2.0)),
                        Column(children: <Widget>[Icon(Icons.favorite, color: Colors.red, size: 30.0,),
                        Text("${feed.likes}")],),
                        Visibility(visible: feed.fillGasTimes != null && feed.fillGasTimes > 0,
                         child: Column(children: <Widget>[Icon(Icons.local_gas_station, color: Colors.purple, size: 30.0,),
                        Text("${feed.fillGasTimes}")],),),
                        Icon(Icons.share, color: Colors.blue, size: 30.0,),
                        Icon(Icons.build, color: Colors.grey, size: 30.0,),
                        Icon(Icons.fastfood, color: Colors.black87, size: 30.0,),
                        Visibility(visible: feed.pictures != null, child: Icon(Icons.filter_hdr, color: Colors.green, size: 30.0,),),
                        Column(children: <Widget>[Icon(Icons.timer, color: Colors.red, size: 30.0,),
                        Text("${feed.spendTime}")],),
                        Padding(padding: new EdgeInsets.only(right: 2.0)),
                      ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
                    ],
                  ),
                  //Image.network("$BASE_Url?center=${feed.positions[0].latitude},${feed.positions[0].longitude}&zoom=12&size=400x400&key=${API_KEY}"),)).toList(),
                  elevation: 2.0,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                ))
            .toList());
  }
}

class Feed {
  final List<Position> positions;
  final String routeName;
  final String urlRoute;
  final User user;
  final int likes;
  final int shareTimes;
  final int fillGasTimes;
  final bool restaurant;
  final bool repair;
  final List<String> pictures;
  final String spendTime;
  final double maxSpeed;
  Feed({this.positions, this.routeName, this.user, this.urlRoute, this.likes, this.shareTimes,
   this.fillGasTimes, this.restaurant, this.repair, this.pictures, this.spendTime, this.maxSpeed});
}

class User{
  final String iconUrl;
  final String userId;
  final String crewId;
  User({this.iconUrl, this.userId, this.crewId});
}