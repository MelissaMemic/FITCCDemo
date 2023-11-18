import 'dart:convert';
import 'dart:io';

import 'package:fitcc_mobile_app/Models/user.dart';

import '../Services/login_service.dart';
import 'base_provider.dart';

class UserProvider extends BaseProvider<User> {
  UserProvider() : super("/api/UserM");
  String name = "";

  HttpClient _client = HttpClient();

  Future<dynamic> getUserData() async {
    name = LoginService().getUserName();
    var url = Uri.parse(
        "http://10.0.2.2:7038/api/UserM/GetByUsername?username=$name");
    Map<String, String> headers = createHeaders();

    var response = await http!.get(url, headers: headers);

    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Dogodila se greska");
    }
  }

  Future<String> getWebsite(String username) async {
    var url = Uri.parse(
        "http://10.0.2.2:7038/api/UserM/GetWebsiteByUsername?username=$username");

    Map<String, String> headers = createHeaders();

    var response = await http!.get(url, headers: headers);
    String rspbody = response.body;

    return rspbody;
    // if (isValidResponseCode(response)) {
    //   //var data = jsonDecode(rspbody);
    //   return rspbody;
    // } else {
    //   throw Exception("Dogodila se greska");
    // }
  }

  Future<bool> checkRole(String username, String role) async {
    var url = Uri.parse(
        "http://10.0.2.2:7038/api/UserM/CheckRoleByUser?username=$username&role=$role");

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
