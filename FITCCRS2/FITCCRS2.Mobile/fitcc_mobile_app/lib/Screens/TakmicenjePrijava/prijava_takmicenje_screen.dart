import 'package:fitcc_mobile_app/Providers/takmicenje-provider.dart';
import 'package:fitcc_mobile_app/Services/login_service.dart';
import 'package:flutter/material.dart';

import '../../Models/tim.dart';
import '../../Providers/tim-provider.dart';
import '../../constants.dart';

class PrijaviTimScreen extends StatefulWidget {
  const PrijaviTimScreen({super.key});
  @override
  _PrijaviTimState createState() => _PrijaviTimState();
}

class _PrijaviTimState extends State<PrijaviTimScreen> {
  var takmicenjeService = TakmicenjeProvisder();
  final _formKey = GlobalKey<FormState>();
  String name = "";
  TextEditingController _nazivTimaController = TextEditingController();
  TextEditingController _brojClanovaController = TextEditingController();
  TextEditingController _takmicenjeId = TextEditingController();
  TextEditingController _errorMessageController = TextEditingController();

  @override
  void initState() {
    name = LoginService().getUserName();
  }

  Future<void> _prijavi() async {
    {
      dynamic id = await takmicenjeService.getLastId();
      var timService = TimProvider();
      Tim tim = Tim();
      tim.naziv = _nazivTimaController.text;
      tim.brojClanova = int.tryParse(_brojClanovaController.text);
      tim.takmicenjeId = id;
      tim.username = name;
      tim.userId = 0;
      var response = await timService.insert(tim);
      if (response!.toJson() != null) {
        Navigator.pushNamed(context, '/homePage');
      } else
        _errorMessageController.text = "Doslo je do greske";
    }
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
                  "Prijavite svoj tim",
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
                      "Naziv tima",
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
                      controller: _nazivTimaController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(7.0),
                          hintText: 'Unesite naziv tima',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Unesite email adresu';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      "Broj clanova tima",
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
                      controller: _brojClanovaController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(7.0),
                          hintText: 'Unesite broj clanova tima',
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
