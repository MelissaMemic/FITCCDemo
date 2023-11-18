import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'projekat.g.dart';

@JsonSerializable()
class Projekat {
  late int? projekatId = 0;
  late String? naziv;
  late String? opis;
  late int? kategorijaId;
  late int? timId;
  late int? userId;
  late String? username;

  Projekat() {}

  factory Projekat.fromJson(Map<String, dynamic> json) =>
      _$ProjekatFromJson(json);
  Map<String, dynamic> toJson() => _$ProjekatToJson(this);
}
