import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:temps/welcome.dart';

class Essai extends StatefulWidget {
  const Essai({Key? key}) : super(key: key);

  @override
  _EssaiState createState() => _EssaiState();
}

class _EssaiState extends State<Essai> {
  var temp;
  var currently;
  var windSpeed;

  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Boston&units=metric&appid=038ce58d1810e756e32ed77c6a940b38"));
    var results = jsonDecode(response.body);
    setState(() {
      temp = results['main']['temp'];
      currently = results['weather'][0]['description'];
      windSpeed = results['wind']['speed'];
    });
  }

  @override
  void iniState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    getWeather();
    return Scaffold(
      body: Column(
          children: <Widget>[

            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Actuellement à Boston", // currently
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Text(
                    temp != null ? temp.toString() + "\u00B0" : "Loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                    ),),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      currently != null ? currently.toString() : "Loading",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                          title: Text("Temperature"),
                          trailing: Text(temp != null
                              ? temp.toString() + "\u00B0"
                              : "load"),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.wind),
                          title: Text("Vitesse du vent"),
                          trailing: Text(windSpeed != null
                              ? windSpeed.toString()
                              : "load"),
                        )
                      ]
                  ),
                )
            ),
            Container(
                child: TextButton(
                  child: Text('Retour'),
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Welocome()));
                  },
                )

            )


          ]
      ),
    );
  }
}
