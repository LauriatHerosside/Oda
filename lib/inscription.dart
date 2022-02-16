import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:temps/connexion.dart';
import 'package:temps/welcome.dart';
class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  final _formKey = GlobalKey<FormState>();
String email ='';
String password ='';
String confirmPass ='';
// fonction de connexion
  static Future <User?> loginUsingEmailPassword
      (
      {
        required String email,
        required String password,
        required BuildContext context})
  async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.symmetric( vertical: 50, horizontal: 30
          ),
          child: Form(
          key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset('images/oda1.png' , height: 200, width: 200),
                Center(
                  child: Text('Creer un nouveau compte', style: Theme.of(context).textTheme.titleLarge),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.deepOrangeAccent),
                    labelText:'Email',
                    border: OutlineInputBorder()

                  ),
                  validator: (val) => val!.isEmpty ? 'Entrez un email' : null,
                  onChanged: (val) => email = val,

                ),// email
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.deepOrangeAccent),
                      labelText:' Mot de passe',
                      border: OutlineInputBorder(
                      )

                  ),
                  validator: (val) => val!.length<5 ? 'Entrez un mot de passe plus long' : null,
                  onChanged: (val) => password = val,
                ),// mot_de_pass
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.deepOrangeAccent),
                      labelText:'Confirmez le mot de passe',
                      border: OutlineInputBorder()
                  ),
                  onChanged: (val) => confirmPass  = val,
                  validator: (val) => confirmPass!= password?'Mot de passe incorrecte!' : null,

                ),// confirmPass
                SizedBox(height: 20),
                FlatButton(
                    onPressed: () async{
                      if (_formKey.currentState!.validate())
                      {
                     // application de la logique mit derriere les textformfield
                      }
// test de l'application
                      User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                      print(user);
                      if( user != null){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context )=> Welocome ()));
                      }

                    },
                    color: Colors.deepOrangeAccent,
                    child: Text('S\'inscrire'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),// boutton inscrire
                SizedBox(height: 20),
                OutlineButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context )=> Conexion ()));
                  },
                  borderSide:BorderSide(width: 1.0, color: Colors.black) ,
                  child: Text('Avez vous dejà un compte?'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
