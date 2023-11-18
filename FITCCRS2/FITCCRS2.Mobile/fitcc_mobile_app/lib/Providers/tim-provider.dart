import 'dart:convert';

import 'package:fitcc_mobile_app/Models/tim.dart';
import 'package:fitcc_mobile_app/Providers/base_provider.dart';

class TimProvider extends BaseProvider<Tim> {
  TimProvider() : super("api/Tim");

  @override
  Tim fromJson(data) {
    return Tim.fromJson(data);
  }

  Future<List> getTimove(String username) async {
    var url = Uri.parse(
        "http://10.0.2.2:7038/api/Tim/getTimsByUser?username=$username");

    Map<String, String> headers = createHeaders();

    var response = await http!.get(url, headers: headers);

    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Dogodila se greska");
    }
  }

  Future<Tim> getTim(String username) async {
    var url = Uri.parse(
        "http://10.0.2.2:7038/api/Tim/getLastTimUser?username=$username");

    Map<String, String> headers = createHeaders();

    var response = await http!.get(url, headers: headers);

    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      return Tim.fromJson(data);
    } else {
      throw Exception("Dogodila se greska");
    }
  }

  Future<int> getTimId(String username) async {
    var url = Uri.parse(
        "http://10.0.2.2:7038/api/Tim/getLastTimUserId?username=$username");

    Map<String, String> headers = createHeaders();

    var response = await http!.get(url, headers: headers);

    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Dogodila se greska");
    }
  }
}
