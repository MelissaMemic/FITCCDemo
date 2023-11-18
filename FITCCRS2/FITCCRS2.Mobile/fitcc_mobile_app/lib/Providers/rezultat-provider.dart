import 'package:fitcc_mobile_app/Models/rezultat.dart';

import '../../Providers/base_provider.dart';

class RezultatProvider extends BaseProvider<Rezultat> {
  RezultatProvider() : super("api/Rezultati");

  @override
  Rezultat fromJson(data) {
    return Rezultat.fromJson(data);
  }
}
