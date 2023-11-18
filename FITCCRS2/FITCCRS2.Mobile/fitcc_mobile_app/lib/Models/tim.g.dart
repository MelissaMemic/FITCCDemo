// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tim _$TimFromJson(Map<String, dynamic> json) => Tim()
  ..naziv = json['naziv'] as String?
  ..brojClanova = json['brojClanova'] as int?
  ..takmicenjeId = json['takmicenjeId'] as int?
  ..userId = json['userId'] as int?
  ..username = json['username'] as String?;

Map<String, dynamic> _$TimToJson(Tim instance) => <String, dynamic>{
      'naziv': instance.naziv,
      'brojClanova': instance.brojClanova,
      'takmicenjeId': instance.takmicenjeId,
      'userId': instance.userId,
      'username': instance.username,
    };
