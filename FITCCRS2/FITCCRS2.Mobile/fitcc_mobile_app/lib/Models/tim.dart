import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'tim.g.dart';

@JsonSerializable()
class Tim {
  late String? naziv;
  late int? brojClanova;
  late int? takmicenjeId;
  late int? userId;
  late String? username;

  // Tim(this.naziv, this.brojClanova, this.takmicenjeId);
  // Tim.register(this.naziv, this.brojClanova, this.takmicenjeId);

  Tim() {}

  factory Tim.fromJson(Map<String, dynamic> json) => _$TimFromJson(json);
  Map<String, dynamic> toJson() => _$TimToJson(this);
  //factory Tim.fromJson(Map<String, dynamic> json) => _$TimFromJson(json);

  // @override
  // Map<String, dynamic> toJson() {
  //   return {
  //     "naziv": naziv,
  //     "brojClanova": brojClanova,
  //     "takmicenjeId": takmicenjeId
  //   };

  //   String timToJson(Tim tim) {
  //     final jsonData = tim.toJson();
  //     return json.encode(jsonData);
  //   }
  // }
}
