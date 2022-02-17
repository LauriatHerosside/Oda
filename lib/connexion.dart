import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:temps/inscription.dart';
import 'package:flutter/services.dart';
import 'package:temps/welcome.dart';





class Conexion extends StatefulWidget {
  const Conexion({Key? key}) : super(key: key);

  @override
  _ConexionState createState() => _ConexionState();
}

class _ConexionState extends State<Conexion> {
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
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found"){
        print ("Cet utilisateur n'existe pas");
      }
    }
    return user;
  }
  final _formKey = GlobalKey<FormState>();
  String email ='';
  String password ='';
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
                  child: Text('Connectez vous!', style: TextStyle( fontSize: 30, fontFamily: 'Signatra') ),
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
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.deepOrangeAccent),
                      labelText:' Mot de passe',
                      border: OutlineInputBorder()
                  ),
                  validator: (val) => val!.length<5 ? 'Entrez un mot de passe plus long' : null,
                  onChanged: (val) => password = val,
                ),// mot_de_pass
                SizedBox(height: 20),
                FlatButton(
                  onPressed: ()async{
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
                  child: Text('Se connecter' , style: TextStyle(
                    fontFamily: 'Signatra',
                    fontSize: 30
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),// Se connecter
                SizedBox(height: 20),
                OutlineButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context )=> Inscription ()));
                  },
                  borderSide:BorderSide(width: 1.0, color: Colors.deepOrangeAccent) ,
                  child: Text('Creer un nouveau compte', style: TextStyle(
                      fontFamily: 'Signatra',
                      fontSize: 25
                  ), ),
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
