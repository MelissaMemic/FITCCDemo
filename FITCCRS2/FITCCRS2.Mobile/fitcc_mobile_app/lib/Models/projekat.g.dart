// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projekat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Projekat _$ProjekatFromJson(Map<String, dynamic> json) => Projekat()
  ..projekatId = json['projekatId'] as int?
  ..naziv = json['naziv'] as String?
  ..opis = json['opis'] as String?
  ..kategorijaId = json['kategorijaId'] as int?
  ..timId = json['timId'] as int?
  ..userId = json['userId'] as int?
  ..username = json['username'] as String?;

Map<String, dynamic> _$ProjekatToJson(Projekat instance) => <String, dynamic>{
      'projekatId': instance.projekatId,
      'naziv': instance.naziv,
      'opis': instance.opis,
      'kategorijaId': instance.kategorijaId,
      'timId': instance.timId,
      'userId': instance.userId,
      'username': instance.username,
    };
