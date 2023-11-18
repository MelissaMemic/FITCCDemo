import 'package:fitcc_mobile_app/Models/user.dart';
import 'package:fitcc_mobile_app/Providers/projekat-provider.dart';
import 'package:fitcc_mobile_app/Providers/tim-provider.dart';
import 'package:fitcc_mobile_app/Providers/user-provider.dart';
import 'package:flutter/material.dart';

import '../../Services/login_service.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});
  @override
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfileScreen> {
  var userService = UserProvider();
  var timService = TimProvider();
  var projekatService = ProjekatProvider();
  var _user;

  @override
  void initState() {
    _fetchData();
  }

  Future<void> _fetchData() async {
    var something = await userService.getUserData();
    setState(() {
      _user = something;
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
                        "Dobro došli!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "FIT Coding Challenge",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(children: [
                          Container(
                            child: Text(
                              "Korisnicko ime: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                _user['username'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(children: [
                          Container(
                            child: Text(
                              "Ime: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                _user['name'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(children: [
                          Container(
                            child: Text(
                              "Prezime: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                _user['lastname'],
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
