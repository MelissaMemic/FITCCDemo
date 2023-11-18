import 'dart:convert';
import 'dart:io';

import 'package:fitcc_mobile_app/Models/dogadjaj.dart';
import 'package:fitcc_mobile_app/Providers/dogadjaj-provider.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<AgendaScreen> {
  var dogadjajService = DogadjajProvider();
  List _agenda = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    var something = await dogadjajService.getDogadjeTakmicenja();
    setState(() {
      _agenda = something;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: _agenda.isEmpty
                ? Center(
                    child: Text(
                    "Nema podataka",
                    style: TextStyle(fontSize: 20),
                  ))
                // The ListView that displays photos
                : ListView.builder(
                    itemCount: _agenda.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return ListTile(
                        title: Text(_agenda[index]['naziv']),
                        subtitle: Text(_agenda[index]['pocetak'] +
                            " " +
                            _agenda[index]['lokacija']),
                      );
                    },
                  )));
  }
}
