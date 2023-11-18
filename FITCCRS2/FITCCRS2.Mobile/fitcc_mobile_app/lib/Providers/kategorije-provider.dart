import 'dart:convert';

import '../Models/kategorija.dart';
import 'base_provider.dart';

class KategorijaProvider extends BaseProvider<Kategorija> {
  KategorijaProvider() : super("api/Kategorija");

  @override
  Kategorija fromJson(data) {
    return Kategorija.fromJson(data);
  }

  Future<List<Kategorija>> getKategorije() async {
    var url = Uri.parse("http://10.0.2.2:7038/api/Kategorija/getLast");

    Map<String, String> headers = createHeaders();

    var response = await http!.get(url, headers: headers);

    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      return data.map((x) => fromJson(x)).cast<Kategorija>().toList();
    } else {
      throw Exception("Dogodila se greska");
    }
  }
}
