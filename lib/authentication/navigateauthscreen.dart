import 'package:floom/authentication/loginscreen.dart';
import 'package:floom/authentication/registerscreen.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

// I added this consts

class NavigateAuthScreen extends StatefulWidget {
  const NavigateAuthScreen({Key? key}) : super(key: key);

  @override
  State<NavigateAuthScreen> createState() => _NavigateAuthScreenState();
}

class _NavigateAuthScreenState extends State<NavigateAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[250],
        body: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                    // I added this const
                    gradient: LinearGradient(colors: GradientColors.blue)),
                child: Center(
                  child: Image.asset(
                    'images/tlogo.png',
                    height: 400, //100
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                // doing dynamic values so everything would be reconst sponsive.
                margin: const EdgeInsets.only(left: 30, right: 30),
                // I added this const
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        // I added this const
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 60,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: GradientColors
                                  .beautifulGreen, // I added this const
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: mystyle(30, Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      // I added this const
                      height: 40,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen())),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 60,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors:
                                  GradientColors.skyBlue, // I added this const
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: mystyle(30, Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}

//10:15
