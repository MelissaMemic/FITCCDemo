import 'package:json_annotation/json_annotation.dart';

part 'kategorija.g.dart';

@JsonSerializable()
class Kategorija {
  late int kategorijaId;
  late String? naziv;
  late String? opis;
  late int? takmicenjeId;

  Kategorija() {}

  factory Kategorija.fromJson(Map<String, dynamic> json) =>
      _$KategorijaFromJson(json);
  Map<String, dynamic> toJson() => _$KategorijaToJson(this);
}
