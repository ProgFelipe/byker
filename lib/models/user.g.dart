// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      iconUrl: json['iconUrl'] as String,
      userId: json['userId'] as String,
      crewId: json['crewId'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'iconUrl': instance.iconUrl,
      'userId': instance.userId,
      'crewId': instance.crewId
    };
