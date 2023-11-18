import 'dart:convert';

import '../Models/projekat.dart';
import 'base_provider.dart';

class ProjekatProvider extends BaseProvider<Projekat> {
  ProjekatProvider() : super("api/Projekat");

  @override
  Projekat fromJson(data) {
    return Projekat.fromJson(data);
  }

  Future<Projekat> getProjekat(String username) async {
    var url = Uri.parse(
        "http://10.0.2.2:7038/api/Projekat/getLastProjekatUser?username=$username");

    Map<String, String> headers = createHeaders();

    var response = await http!.get(url, headers: headers);

    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      return Projekat.fromJson(data);
    } else {
      throw Exception("Dogodila se greska");
    }
  }
}
