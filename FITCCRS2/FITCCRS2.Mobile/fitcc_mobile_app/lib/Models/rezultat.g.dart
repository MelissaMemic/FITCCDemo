// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rezultat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rezultat _$RezultatFromJson(Map<String, dynamic> json) => Rezultat()
  ..bod = json['bod'] as int?
  ..napomena = json['napomena'] as String?
  ..projekatId = json['projekatId'] as int?;

Map<String, dynamic> _$RezultatToJson(Rezultat instance) => <String, dynamic>{
      'bod': instance.bod,
      'napomena': instance.napomena,
      'projekatId': instance.projekatId,
    };
