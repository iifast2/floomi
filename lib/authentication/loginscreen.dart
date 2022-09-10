import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:floom/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
   // int count;
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

                    const SizedBox(height: 50,),

                    Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: TextField(
                        style: mystyle(18,Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          hintText: " Email ",
                          prefixIcon: const Icon(Icons.email),                  // I added Const
                          hintStyle: mystyle(20,Colors.grey,FontWeight.w700),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: TextField(
                        style: mystyle(18,Colors.black),
                        //keyboardType: TextInputType.emailAddress,
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          hintText: " Password ",
                          prefixIcon: const Icon(Icons.lock),                  // I added Const
                          hintStyle: mystyle(20,Colors.grey,FontWeight.w700),
                        ),
                      ),
                    ),

                  const SizedBox(height: 40),

                    InkWell(
                      onTap: () => {
                       // int count = 0,
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text),
                        Navigator.pop(context),
                        //Navigator.popUntil(context, (route) => false),
                        // count++ == 2,

                        /*
                           // this is how it should be
                         Navigator.popUntil(context, (route)){
                          return count++ == 2;
                        */
              //},

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,                                   //change the height as you like
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: GradientColors
                                  .beautifulGreen,                    // I added this const
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: mystyle(25, Colors.white),    //change the 25 value as you like
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
