import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temps/main.dart';
import 'package:temps/meteo.dart';
import 'package:temps/essai.dart';
import 'package:temps/welcome.dart';
import 'package:temps/inscription.dart';
import 'package:temps/connexion.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Conexion (),
    );
  }
}

// creation de la mise en page principale de l'application
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // initialisation de firebase
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot)
          {
            if (snapshot.connectionState == ConnectionState.done)
              {
                return Conexion();
              }
            return const Center(
              child: CircularProgressIndicator(),

            );
          },
        )
    );
  }
}

/*class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // fonction de cpnnexion
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
  @override
  Widget build(BuildContext context) {
    // create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text("Mon Application" ,
            style: TextStyle(
              color:Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Connectez vous",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
           TextField(
            controller: _emailController,
            decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email, color: Colors.cyan,)
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock, color: Colors.cyan,)
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            width: double.infinity ,
            child: RawMaterialButton(
              fillColor: const Color(0xFFFE0050),
              elevation: 0.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12) ),
              padding:  const EdgeInsets.symmetric(vertical: 20.0),
              onPressed: ()  async{
                // test de l'application
                User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                print(user);
                if( user != null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context )=> Welocome ()));
                }
              },
              child:  const Text("Connexion",
                style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                ), ),
            ),
          )
        ],

      ),
    );
  }
}*/








