import 'dart:convert';
import 'dart:io';

import 'package:fitcc_mobile_app/Models/takmicenje.dart';
import 'package:fitcc_mobile_app/Providers/dogadjaj-provider.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_provider.dart';

class TakmicenjeProvisder extends BaseProvider<Takmicenje> {
  TakmicenjeProvisder() : super("/api/Takmicenje");

  Future<int?> getLastId() async {
    var url = Uri.parse("http://10.0.2.2:7038/api/Takmicenje/lastTakmicenje");

    Map<String, String> headers = createHeaders();

    var response = await http!.get(url, headers: headers);

    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      return data["takmicenjeId"];
    } else {
      throw Exception("Dogodila se greska");
    }
  }
}
