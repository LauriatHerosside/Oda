import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:temps/welcome.dart';

class Meteo extends StatefulWidget {
  const Meteo({Key? key}) : super(key: key);

  @override
  _MeteoState createState() => _MeteoState();
}

class _MeteoState extends State<Meteo> {

  var temp;
  var currently;
  var windSpeed;
  Future getWeather() async{
    http.Response response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=chicago&units=metric&appid=038ce58d1810e756e32ed77c6a940b38"));
    var results = jsonDecode(response.body);
    setState(() {
      temp = results['main']['temp'];
      currently= results['weather'][0]['description'];
      windSpeed= results['wind']['speed'];
    });
  }
  @override
  void iniState(){
    super.initState();
    getWeather();
  }
  @override

  Widget build(BuildContext context) {
    getWeather();
    return Scaffold(

      body: Column(
        children: <Widget> [
          Container(
            height: MediaQuery.of(context).size.height  /3,
            width: MediaQuery.of(context).size.width,
            color: Colors.deepOrangeAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child:  Text(
                    "Actuellement à Chicago",// currently
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Signatra',
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Text(
                  temp != null? temp.toString() + "\u00B0" :"Loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: 'Signatra',
                    fontWeight: FontWeight.w600,
                  ),),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child:  Text(
                    currently != null ? currently.toString(): "Loading",
                    style: TextStyle(
                      fontFamily: 'signatra',
                        color: Colors.white,
                        fontSize: 20,
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
                child: ListView (
                    children: <Widget>[
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                        title: Text("Temperature" , style: TextStyle( fontSize: 40, fontFamily: 'signatra'),),
                        trailing: Text(temp != null ? temp.toString()  +"\u00B0" : "load" , style: TextStyle(
                          fontFamily: 'signatra', fontSize: 20
                        ),),
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.wind),
                        title: Text("Vitesse du vent" ,style: TextStyle(
                            fontFamily: 'signatra', fontSize: 40
                        ),),
                        trailing: Text(windSpeed != null? windSpeed.toString() +"Km/h" : "load" , style: TextStyle(
                            fontFamily: 'signatra', fontSize: 20
                        ),),
                      )


                    ]
                ),
              )
          ),
          Container(
              child: TextButton(
                child: Text('Retour' , style: TextStyle(
                  fontFamily: 'Signatra',
                  fontSize: 30,
                  color: Colors.deepOrangeAccent,
                ),),
                onPressed: ()async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context )=> Welocome()));
                },
              )

          )
        ],
      ),

    );
  }
}

