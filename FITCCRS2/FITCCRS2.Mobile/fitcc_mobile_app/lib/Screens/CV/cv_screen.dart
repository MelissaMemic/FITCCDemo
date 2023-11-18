import 'package:fitcc_mobile_app/Providers/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../Services/login_service.dart';
import '../../constants.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({super.key});
  @override
  _CVScreenState createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String website = "";

  @override
  void initState() {
    name = LoginService().getUserName();
    _fetchData();
  }

  Future<void> _fetchData() async {
    var something = await UserProvider().getWebsite(name);
    setState(() {
      website = something;
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
            decoration: const BoxDecoration(color: Colors.white),
          ),
          SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              Container(
                child: const Text(
                  "Moj CV",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                child: Column(children: <Widget>[
                  Container(
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 10, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  QrImage(
                    data: website,
                    size: 300,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ]),
              )
            ]),
          )
        ],
      ),
    );
  }
}
