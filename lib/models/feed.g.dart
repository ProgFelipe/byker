// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
      positions: (json['positions'] as List)?.map((e) => e as String)?.toList(),
      type: _$enumDecodeNullable(_$FeedTypeEnumMap, json['type']),
      url: json['url'] as String,
      routeName: json['routeName'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      urlRoute: json['urlRoute'] as String,
      likes: json['likes'] as int,
      shareTimes: json['shareTimes'] as int,
      fillGasTimes: json['fillGasTimes'] as int,
      restaurant: json['restaurant'] as bool,
      repair: json['repair'] as bool,
      pictures: (json['pictures'] as List)?.map((e) => e as String)?.toList(),
      spendTime: json['spendTime'] as String,
      maxSpeed: (json['maxSpeed'] as num)?.toDouble())
    ..key = json['key'] as String;
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'key': instance.key,
      'positions': instance.positions,
      'type': _$FeedTypeEnumMap[instance.type],
      'routeName': instance.routeName,
      'urlRoute': instance.urlRoute,
      'user': instance.user,
      'likes': instance.likes,
      'shareTimes': instance.shareTimes,
      'fillGasTimes': instance.fillGasTimes,
      'restaurant': instance.restaurant,
      'repair': instance.repair,
      'url': instance.url,
      'pictures': instance.pictures,
      'spendTime': instance.spendTime,
      'maxSpeed': instance.maxSpeed
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$FeedTypeEnumMap = <FeedType, dynamic>{
  FeedType.publicity: 'publicity',
  FeedType.feed: 'feed',
  FeedType.event: 'event'
};
