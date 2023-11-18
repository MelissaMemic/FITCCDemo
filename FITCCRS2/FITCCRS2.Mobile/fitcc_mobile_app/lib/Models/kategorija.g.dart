// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kategorija.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kategorija _$KategorijaFromJson(Map<String, dynamic> json) => Kategorija()
  ..kategorijaId = json['kategorijaId'] as int
  ..naziv = json['naziv'] as String?
  ..opis = json['opis'] as String?
  ..takmicenjeId = json['takmicenjeId'] as int?;

Map<String, dynamic> _$KategorijaToJson(Kategorija instance) =>
    <String, dynamic>{
      'kategorijaId': instance.kategorijaId,
      'naziv': instance.naziv,
      'opis': instance.opis,
      'takmicenjeId': instance.takmicenjeId,
    };
