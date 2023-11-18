import 'package:fitcc_mobile_app/Models/kategorija.dart';
import 'package:fitcc_mobile_app/Models/projekat.dart';
import 'package:fitcc_mobile_app/Models/rezultat.dart';
import 'package:fitcc_mobile_app/Providers/kategorije-provider.dart';
import 'package:fitcc_mobile_app/Providers/projekat-provider.dart';
import 'package:fitcc_mobile_app/Providers/rezultat-provider.dart';
import 'package:fitcc_mobile_app/Providers/tim-provider.dart';
import 'package:fitcc_mobile_app/constants.dart';
import 'package:flutter/material.dart';

import '../../Services/login_service.dart';

class RezultatScreen extends StatefulWidget {
  const RezultatScreen({super.key});
  @override
  _RezultatScreenState createState() => _RezultatScreenState();
}

class _RezultatScreenState extends State<RezultatScreen> {
  final _formKey = GlobalKey<FormState>();
  var timService = TimProvider();
  var kategorijaService = KategorijaProvider();
  String name = "";
  TextEditingController _bodController = TextEditingController();
  TextEditingController _napomenaController = TextEditingController();
  TextEditingController _errorMessageController = TextEditingController();
  List<Projekat> _projekti = [];
  int timId = 0;
  Projekat dropdownvalue = Projekat();

  @override
  void initState() {
    name = LoginService().getUserName();
    _fetchDataProjekti();
  }

  Future<void> _prijavi() async {
    {
      var rezultatService = RezultatProvider();
      Rezultat rezultat = Rezultat();
      rezultat.bod = int.tryParse(_bodController.text);
      rezultat.napomena = _napomenaController.text;
      rezultat.projekatId = dropdownvalue.projekatId;
      var response = await rezultatService.insert(rezultat);
      if (response!.toJson() != null) {
        Navigator.pushNamed(context, '/homePage');
      } else
        _errorMessageController.text = "Doslo je do greske";
    }
  }

  Future<void> _fetchDataProjekti() async {
    var projekatService = ProjekatProvider();
    var projektii = await projekatService.get();
    setState(() {
      _projekti = projektii;
      dropdownvalue = _projekti[0];
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
                  "Ocjenite projekat",
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
                      "Bod ",
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
                      controller: _bodController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(7.0),
                          hintText: 'Unesite bodove projekta',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Unesite bodove projekta';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      "Napomena ",
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
                      controller: _napomenaController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(7.0),
                          hintText: 'Unesite napomenu',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Unesite napomenu';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      "Odaberi projekat ",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: DropdownButton<Projekat>(
                      value: dropdownvalue,
                      style: TextStyle(color: Colors.black),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      dropdownColor: Colors.white,
                      items: _projekti
                          .map((Projekat kat) => DropdownMenuItem<Projekat>(
                                child: Text(
                                  kat.naziv.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: kat,
                              ))
                          .toList(),
                      onChanged: (Projekat? kat) =>
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
