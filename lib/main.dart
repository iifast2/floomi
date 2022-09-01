import 'package:flutter/material.dart';
import 'package:floom/screens/homepage.dart';
import 'package:floom/screens/introauthscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  Widget build(BuildContext context) {
    return Scaffold (
        body : isSigned == false ? IntroAuthScreen() : HomePage(),
    );

  }
}
