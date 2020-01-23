import 'package:bayker/models/feed.dart';
import 'package:flutter/material.dart';

class Crew extends StatelessWidget {
  const Crew({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        RiderInfo(),
        RiderRecords(),
        RiderCrew(),
        Container(
          child: MyRides(),
        )
      ],
    );
  }
}

class MyRides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const BASE_Url = "https://maps.googleapis.com/maps/api/staticmap";
    List<Feed> feeds = [
      Feed(
          likes: 20,
          shareTimes: 4,
          routeName: "Medellin - Filandia",
          fillGasTimes: 2,
          urlRoute: "assets/images/staticmap3.jpg",
          pictures: ["", ""],
          spendTime: "4h 30m"),
      Feed(
          likes: 80,
          shareTimes: 100,
          routeName: "Medellin - Cocorna",
          urlRoute: "assets/images/staticmap2.jpg",
          spendTime: "7h 45m"),
      Feed(
          likes: 1,
          shareTimes: 7,
          routeName: "Medellin - Rio Claro",
          urlRoute: "assets/images/staticmap3.jpg",
          spendTime: "2h 30m")
    ];

    Widget _buildFeed(Feed feed) {
      return Card(
        child: Column(
          children: <Widget>[
            Text(
              "${feed.routeName}",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              feed.urlRoute,
              filterQuality: FilterQuality.medium,
              fit: BoxFit.fitWidth,
            ),
            Row(
              children: <Widget>[
                Padding(padding: new EdgeInsets.only(left: 2.0)),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    Text("${feed.likes}")
                  ],
                ),
                Visibility(
                  visible: feed.fillGasTimes != null && feed.fillGasTimes > 0,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.local_gas_station,
                        color: Colors.purple,
                        size: 30.0,
                      ),
                      Text("${feed.fillGasTimes}")
                    ],
                  ),
                ),
                Icon(
                  Icons.share,
                  color: Colors.blue,
                  size: 30.0,
                ),
                Icon(
                  Icons.build,
                  color: Colors.grey,
                  size: 30.0,
                ),
                Icon(
                  Icons.fastfood,
                  color: Colors.black87,
                  size: 30.0,
                ),
                Visibility(
                  visible: feed.pictures != null,
                  child: Icon(
                    Icons.filter_hdr,
                    color: Colors.green,
                    size: 30.0,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    Text("${feed.spendTime}")
                  ],
                ),
                Padding(padding: new EdgeInsets.only(right: 2.0)),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ],
        ),
        //Image.network("$BASE_Url?center=${feed.positions[0].latitude},${feed.positions[0].longitude}&zoom=12&size=400x400&key=${API_KEY}"),)).toList(),
        elevation: 2.0,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      );
    }

    // TODO: implement build
    return ListView.builder(
      itemCount: feeds.length,
      itemBuilder: (BuildContext ctxt, int index) => _buildFeed(feeds[index]),
      shrinkWrap: true,
      physics: ScrollPhysics(),
    );
  }
}

class RiderCrew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Text("TODO Groups, Group Awards, Group ranking, Group Country"));
  }
}

class RiderRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
          "TODO Records, kms, top speed, roads with friends, winned medals"),
    );
  }
}

class RiderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                child: Image.asset("assets/images/helmeth1.png"),
              ),
              Text(
                "Bayker Guti",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Row(
            children: <Widget>[
              Padding(
                child: Text("Blood type: A+"),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
              Padding(
                child: Text("Emergency contact: +57-3012142019"),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              )
            ],
          ),
          Padding(
            child: Text("Moto: BMW F800 Model: 2012"),
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
          )
        ],
      ),
      elevation: 0.0,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
    );
  }
}
