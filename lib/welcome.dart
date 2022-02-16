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

      body: Center(
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
      ),
    );
  }
}
