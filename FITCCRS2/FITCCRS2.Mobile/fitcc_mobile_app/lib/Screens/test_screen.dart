import 'package:fitcc_mobile_app/constants.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 125, 176, 235),
                  Color.fromARGB(255, 90, 156, 237),
                  Color.fromARGB(255, 73, 149, 235),
                  Color.fromARGB(255, 69, 141, 230),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding:
                    EdgeInsets.symmetric(horizontal: 40.0, vertical: 140.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Prijavite se",
                      style: TextStyle(
                        color: kPrimaryLightColor,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Email adresa",
                          style: TextStyle(
                              color: kPrimaryLightColor,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: kPrimaryLightColor),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(7.0),
                                hintText: 'Unesite svoju email adresu',
                                hintStyle: TextStyle(
                                    color: kPrimaryLightColor,
                                    fontWeight: FontWeight.w300)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Lozinku",
                          style: TextStyle(
                              color: kPrimaryLightColor,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: kPrimaryLightColor),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(7.0),
                                hintText: 'Unesite svoju lozinku',
                                hintStyle: TextStyle(
                                    color: kPrimaryLightColor,
                                    fontWeight: FontWeight.w300)),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
