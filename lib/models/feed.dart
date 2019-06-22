import 'package:geolocator/geolocator.dart';
import 'package:bayker/models/user.dart';

class Feed {
  final List<Position> positions;
  FeedType type = FeedType.feed;
  final String routeName;
  final String urlRoute;
  final User user;
  final int likes;
  final int shareTimes;
  final int fillGasTimes;
  final bool restaurant;
  final bool repair;
  final String url;
  final List<String> pictures;
  final String spendTime;
  final double maxSpeed;
  Feed({this.positions, this.type, this.url, this.routeName, this.user, this.urlRoute, this.likes, this.shareTimes,
   this.fillGasTimes, this.restaurant, this.repair, this.pictures, this.spendTime, this.maxSpeed});
}


enum FeedType {
  publicity,
  feed
}
