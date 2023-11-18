import 'package:fitcc_mobile_app/Models/projekat.dart';
import 'package:fitcc_mobile_app/Providers/projekat-provider.dart';
import 'package:fitcc_mobile_app/Providers/tim-provider.dart';
import 'package:flutter/material.dart';

import '../../Models/tim.dart';
import '../../Providers/user-provider.dart';
import '../../Services/login_service.dart';

class PredledPrijavaScreen extends StatefulWidget {
  const PredledPrijavaScreen({super.key});
  @override
  _PredledPrijavaScreenState createState() => _PredledPrijavaScreenState();
}

class _PredledPrijavaScreenState extends State<PredledPrijavaScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  Tim tim = Tim();
  Projekat projekat = Projekat();

  @override
  void initState() {
    name = LoginService().getUserName();
    _fetchData();
  }

  Future<void> _fetchData() async {
    var something = await TimProvider().getTim(name);
    var something2 = await ProjekatProvider().getProjekat(name);
    setState(() {
      tim = something;
      projekat = something2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.black),
      ),
      Container(
          height: double.infinity,
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Trenutni tim i projekat",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Column(children: [
                          Container(
                            child: Text(
                              "Dodani tim: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                tim.naziv.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(children: [
                          Container(
                            child: Text(
                              "Broj clanova tima: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                tim.brojClanova.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Column(children: [
                          Container(
                            child: Text(
                              "Projekat: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                projekat.naziv.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(children: [
                          Container(
                            child: Text(
                              "Opis projekata: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                projekat.opis.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ])))
    ]));
  }
}
