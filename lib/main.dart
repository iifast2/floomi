import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:floom/screens/homepage.dart';
import 'package:floom/screens/introauthscreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );                  // restart my app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(                               // I added this const
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),

    );
  }
}

// stateful : stfl ( ctrl + space )
class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = false ;

   @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null){
        setState(() {
          isSigned = true;

        });
      } else {
        setState(() {
          isSigned = false;
        });
      }
    });
     super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body : isSigned == false ? const IntroAuthScreen() : const HomePage(),      // I added const // on both
    );

  }
}
