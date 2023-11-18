import 'package:json_annotation/json_annotation.dart';

part 'rezultat.g.dart';

@JsonSerializable()
class Rezultat {
  late int? bod;
  late String? napomena;
  late int? projekatId;

  Rezultat() {}

  factory Rezultat.fromJson(Map<String, dynamic> json) =>
      _$RezultatFromJson(json);
  Map<String, dynamic> toJson() => _$RezultatToJson(this);
}
