import 'package:bayker/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  String key;
  final List<String> positions;
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
  Feed(
      {this.positions,
      this.type,
      this.url,
      this.routeName,
      this.user,
      this.urlRoute,
      this.likes,
      this.shareTimes,
      this.fillGasTimes,
      this.restaurant,
      this.repair,
      this.pictures,
      this.spendTime,
      this.maxSpeed});

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}

enum FeedType { publicity, feed, event }
