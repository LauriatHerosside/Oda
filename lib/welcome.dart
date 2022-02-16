import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temps/essai.dart';
import 'package:temps/meteo.dart';

class Welocome extends StatefulWidget {
  const Welocome({Key? key}) : super(key: key);

  @override
  _WelocomeState createState() => _WelocomeState();
}

class _WelocomeState extends State<Welocome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextButton(
                child: Text("CHICAGO"
                    ),
                style: TextButton.styleFrom(
                  primary:  Colors.white,
                  backgroundColor: Colors.redAccent,
                  onSurface: Colors.grey,
                  textStyle: TextStyle()
                ),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context )=> Meteo ()));
                },
              ),
              TextButton(
                child: Text("BOSTON"),
                style: TextButton.styleFrom(
                    primary:  Colors.white,
                    backgroundColor: Colors.redAccent,
                    onSurface: Colors.grey,
                    textStyle: TextStyle()
                ),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context )=> Essai ()));
                },
              ),
            ],
        ),
      ),*/
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: 130),
        alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("MéteoApp" , style: TextStyle(
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
              onPressed: (){},
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text('Boston', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),

            ),


          )
        ],
      ),
      ),

    );
  }
}
