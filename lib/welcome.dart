import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temps/essai.dart';
import 'package:temps/meteo.dart';
import 'package:temps/connexion.dart';

class Welocome extends StatefulWidget {
  const Welocome({Key? key}) : super(key: key);

  @override
  _WelocomeState createState() => _WelocomeState();
}

class _WelocomeState extends State<Welocome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: 130),
        alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("MétéoApp" , style: TextStyle(
              fontFamily: 'Signatra',
              fontSize: 100,
              color: Colors.deepOrangeAccent,

            ),
            ),
          ),
          SizedBox( height: 20),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25) ,
            child: RaisedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context )=> Essai()));
              },
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text('Boston', style: TextStyle(
                fontSize: 30,
                fontFamily: 'Signatra'
              ),),

            ),


          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25) ,
            child: RaisedButton(
              onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context )=> Meteo()));},
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text('Chicago', style: TextStyle(
                fontFamily: 'Signatra',
                fontSize: 30,
              ),),

            ),


          ),
          SizedBox(height: 90),
          Container(
              child: TextButton(
                child: Text('Retour',
                  style: TextStyle(
                    fontFamily: 'Signatra',
                    fontSize: 30,
                    color: Colors.deepOrangeAccent,
                  ),),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Conexion()));
                },
              )

          ),





        ],
      ),
      ),

    );
  }
}
