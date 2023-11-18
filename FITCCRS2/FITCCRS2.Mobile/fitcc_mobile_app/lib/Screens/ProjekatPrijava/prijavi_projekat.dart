import 'package:fitcc_mobile_app/Models/kategorija.dart';
import 'package:fitcc_mobile_app/Models/projekat.dart';
import 'package:fitcc_mobile_app/Models/tim.dart';
import 'package:fitcc_mobile_app/Providers/kategorije-provider.dart';
import 'package:fitcc_mobile_app/Providers/projekat-provider.dart';
import 'package:fitcc_mobile_app/Providers/tim-provider.dart';
import 'package:fitcc_mobile_app/constants.dart';
import 'package:flutter/material.dart';

import '../../Services/login_service.dart';

class PrijaviProjekatScreen extends StatefulWidget {
  const PrijaviProjekatScreen({super.key});
  @override
  _PrijaviProjekatState createState() => _PrijaviProjekatState();
}

class _PrijaviProjekatState extends State<PrijaviProjekatScreen> {
  final _formKey = GlobalKey<FormState>();
  var timService = TimProvider();
  var kategorijaService = KategorijaProvider();
  String name = "";
  TextEditingController _nazivProjektaController = TextEditingController();
  TextEditingController _opisProjekta = TextEditingController();
  TextEditingController _timId = TextEditingController();
  TextEditingController _kategorijaId = TextEditingController();
  TextEditingController _errorMessageController = TextEditingController();
  List<Kategorija> _kategorije = [];
  int timId = 0;
  Kategorija dropdownvalue = Kategorija();

  @override
  void initState() {
    name = LoginService().getUserName();
    _fetchDataTim();
    _fetchDataKategorije();
  }

  Future<void> _prijavi() async {
    {
      var projekatService = ProjekatProvider();
      Projekat projekat = Projekat();
      projekat.naziv = _nazivProjektaController.text;
      projekat.opis = _opisProjekta.text;
      projekat.kategorijaId = dropdownvalue.kategorijaId;
      projekat.username = name;
      projekat.userId = 0;
      projekat.timId = timId;
      var response = await projekatService.insert(projekat);
      if (response!.toJson() != null) {
        Navigator.pushNamed(context, '/homePage');
      } else
        _errorMessageController.text = "Doslo je do greske";
    }
  }

  Future<void> _fetchDataTim() async {
    var timUserId = await timService.getTimId(name);
    setState(() {
      timId = timUserId;
    });
  }

  Future<void> _fetchDataKategorije() async {
    var kategorije = await kategorijaService.getKategorije();
    setState(() {
      _kategorije = kategorije;
      dropdownvalue = _kategorije[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              Container(
                child: const Text(
                  "Prijavite svoj projekat",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                  child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      "Naziv projekta",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60.0,
                    margin: EdgeInsets.only(left: 6, right: 6),
                    child: TextFormField(
                      controller: _nazivProjektaController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(7.0),
                          hintText: 'Unesite naziv projekta',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Unesite naziv projekta';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      "Opis projekta",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60.0,
                    margin: EdgeInsets.only(left: 6, right: 6),
                    child: TextFormField(
                      controller: _opisProjekta,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(7.0),
                          hintText: 'Unesite opis projekta',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Unesite broj clanova';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      "Odaberi kategoriju ",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: DropdownButton<Kategorija>(
                      value: dropdownvalue,
                      style: TextStyle(color: Colors.white),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      dropdownColor: Colors.white,
                      items: _kategorije
                          .map((Kategorija kat) => DropdownMenuItem<Kategorija>(
                                child: Text(
                                  kat.naziv.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: kat,
                              ))
                          .toList(),
                      onChanged: (Kategorija? kat) =>
                          setState(() => dropdownvalue = kat!),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _prijavi();
                        }
                      },
                      child: const Text(
                        'Dalje',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ]),
              ))
            ]),
          )
        ],
      ),
    );
  }
}
