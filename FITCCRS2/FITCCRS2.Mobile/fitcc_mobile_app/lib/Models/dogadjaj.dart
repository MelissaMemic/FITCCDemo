import 'dart:convert';

class Dogadjaj {
  late int dogadjajId;
  late String naziv;
  late int trajanje;
  late String pocetak;
  late String kraj;
  late String napomena;
  late int agendaId;
  late String lokacija;

  Dogadjaj(this.dogadjajId, this.naziv, this.trajanje, this.pocetak, this.kraj,
      this.napomena, this.agendaId, this.lokacija);

  factory Dogadjaj.fromJson(Map<String, dynamic> map) {
    return Dogadjaj(
        map['dogadjajId'],
        map['naziv'],
        map['trajanje'],
        map['pocetak'],
        map['kraj'],
        map['napomena'],
        map['agendaId'],
        map['lokacija']);
  }

  static Dogadjaj DogadjajFromJson(String json) {
    final data = const JsonDecoder().convert(json);
    return Dogadjaj.fromJson(data);
  }
}
