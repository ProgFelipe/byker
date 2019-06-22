import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:bayker/models/feed.dart';
import 'package:bayker/models/user.dart';

const API_KEY = "AIzaSyCxAI5dx-_-DvIYp1kdIABum8iJwAdtbrE";

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var position = Position(latitude: 19.1550318, longitude: -96.132319);
    const BASE_Url = "https://maps.googleapis.com/maps/api/staticmap";
    List<Feed> feeds = [
      Feed(type: FeedType.publicity, url: "assets/images/sponsor.png"),
      Feed(positions: [position], likes: 20, shareTimes: 4, user: User(iconUrl: "assets/images/helmeth1.png",), routeName: "Medellin - Filandia", fillGasTimes: 2, urlRoute: "assets/images/staticmap3.jpg", pictures: ["",""], spendTime: "4h 30m"),
      Feed(type: FeedType.publicity, url: "assets/images/sponsor1.jpg"),
      Feed(positions: [position], likes: 80, shareTimes: 100, user: User(iconUrl: "assets/images/helmeth2.png",) ,routeName: "Medellin - Cocorna", urlRoute: "assets/images/staticmap2.jpg", spendTime: "7h 45m"),
      Feed(type: FeedType.publicity, url: "assets/images/sponsor2.jpg"),
      Feed(positions: [position],likes: 1, shareTimes: 7, user: User(iconUrl: "assets/images/helmeth1.png",), routeName: "Medellin - Rio Claro", urlRoute: "assets/images/staticmap3.jpg", spendTime: "2h 30m")
    ];

    Widget _buildFeed(Feed feed){
      if(feed.type == FeedType.publicity){
              return Sponsor(url: feed.url);
            }else{
              return Card(
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
                );}
    }
    // TODO: implement build
    return ListView(
        children: feeds
            .map((feed) => _buildFeed(feed))
            .toList());
  }
}

class Sponsor extends StatelessWidget{
  final String url;
  Sponsor({this.url});
  @override
  Widget build(BuildContext context) {
    return Card(child: Image.asset(url),);
  }
}
