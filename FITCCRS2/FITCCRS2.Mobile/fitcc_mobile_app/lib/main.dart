// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:fitcc_mobile_app/Screens/Agenda/agenda_screen.dart';
import 'package:fitcc_mobile_app/Screens/CV/cv_screen.dart';
import 'package:fitcc_mobile_app/Screens/Login/login_screen.dart';
import 'package:fitcc_mobile_app/Screens/PocetnaTakmicar/pocetna_takmicar_screen.dart';
import 'package:fitcc_mobile_app/Screens/PregledPrijava/pregled_prijava_screen.dart';
import 'package:fitcc_mobile_app/Screens/Registration/registration_screen.dart';
import 'package:fitcc_mobile_app/Screens/Rezultat/rezultat-screen.dart';
import 'package:fitcc_mobile_app/Screens/User/user-profile-screen.dart';
import 'package:fitcc_mobile_app/Screens/Welcome/welcome_screen.dart';
import 'package:fitcc_mobile_app/Services/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Providers/user-provider.dart';
import 'Screens/ProjekatPrijava/prijavi_projekat.dart';
import 'Screens/TakmicenjePrijava/prijava_takmicenje_screen.dart';
import 'my_drawer_header.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  var routes = {
    "/welcome": (context) => WelcomeScreen(),
    "/login": (context) => LoginScreen(),
    "/registration": (context) => RegistrationScreen(),
    "/takmicenjePrijava": (context) => PrijaviTimScreen(),
    "/pocetnaTakmicar": (context) => PocetnaTakmicarScreen(),
    "/projekatPrjava": (context) => PrijaviProjekatScreen(),
    "/adenda": (context) => AgendaScreen(),
    "/homePage": (context) => HomePage(),
    "/profil": (context) => UserProfileScreen(),
  };

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: LoginService().isLoggedIn == true ? HomePage() : LoginScreen(),
      routes: routes,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  bool isTakmicar = false;
  bool isZiri = false;
  var userService = UserProvider();
  var currentPage = DrawerSections.pocetnaTakmicar;
  void _logout() {
    LoginService().setResponseFalse();
    Navigator.pushNamed(context, '/login');
  }

  @override
  void initState() {
    name = LoginService().getUserName();
    _fetchDataIsTakmicar();
    _fetchDataIsKomisija();
  }

  Future<void> _fetchDataIsTakmicar() async {
    var something = await userService.checkRole(name, "takmicar");
    setState(() {
      isTakmicar = something;
    });
  }

  Future<void> _fetchDataIsKomisija() async {
    var something = await userService.checkRole(name, "ziri");
    setState(() {
      isZiri = something;
    });
  }

  @override
  Widget build(BuildContext context) {
    var containter;
    if (currentPage == DrawerSections.pocetnaTakmicar) {
      containter = PocetnaTakmicarScreen();
    } else if (currentPage == DrawerSections.takmicenjePrijava) {
      containter = PrijaviTimScreen();
    } else if (currentPage == DrawerSections.projekatPrjava) {
      containter = PrijaviProjekatScreen();
    } else if (currentPage == DrawerSections.agenda) {
      containter = AgendaScreen();
    } else if (currentPage == DrawerSections.profil) {
      containter = UserProfileScreen();
    } else if (currentPage == DrawerSections.cv) {
      containter = CVScreen();
    } else if (currentPage == DrawerSections.rezultat) {
      containter = RezultatScreen();
    } else if (currentPage == DrawerSections.pregledtimptojekat) {
      containter = PredledPrijavaScreen();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FITCC",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      body: containter,
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              MyDrawerHeader(),
              MyDrawerList(),
            ],
          ),
        )),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        menuItem(1, "Pocetna",
            currentPage == DrawerSections.pocetnaTakmicar ? true : false),
        if (isTakmicar)
          menuItem(2, "Tim",
              currentPage == DrawerSections.takmicenjePrijava ? true : false),
        if (isTakmicar)
          menuItem(3, "Projekat",
              currentPage == DrawerSections.projekatPrjava ? true : false),
        menuItem(
            4, "Agenda", currentPage == DrawerSections.agenda ? true : false),
        menuItem(6, "Moj profil",
            currentPage == DrawerSections.profil ? true : false),
        if (isTakmicar)
          menuItem(
              7, "Moj CV", currentPage == DrawerSections.cv ? true : false),
        if (isZiri)
          menuItem(8, "Ocjene",
              currentPage == DrawerSections.rezultat ? true : false),
        if (isTakmicar)
          menuItem(9, "Pregled prijava",
              currentPage == DrawerSections.pregledtimptojekat ? true : false),
        Container(
          child: TextButton(
              onPressed: () {
                _logout();
              },
              child: Text("Logout")),
        )
      ]),
    );
  }

  Widget menuItem(int id, String title, bool selected) {
    return Material(
      color: selected ? Color.fromARGB(255, 219, 243, 255) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.pocetnaTakmicar;
            } else if (id == 2) {
              currentPage = DrawerSections.takmicenjePrijava;
            } else if (id == 3) {
              currentPage = DrawerSections.projekatPrjava;
            } else if (id == 4) {
              currentPage = DrawerSections.agenda;
            } else if (id == 5) {
              currentPage = DrawerSections.login;
            } else if (id == 6) {
              currentPage = DrawerSections.profil;
            } else if (id == 7) {
              currentPage = DrawerSections.cv;
            } else if (id == 8) {
              currentPage = DrawerSections.rezultat;
            } else if (id == 9) {
              currentPage = DrawerSections.pregledtimptojekat;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  pocetnaTakmicar,
  projekatPrjava,
  cv,
  profil,
  agenda,
  takmicenjePrijava,
  login,
  rezultat,
  pregledtimptojekat
}
