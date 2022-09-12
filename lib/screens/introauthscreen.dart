import 'package:floom/authentication/navigateauthscreen.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class IntroAuthScreen extends StatefulWidget {
  const IntroAuthScreen({Key? key}) : super(key: key);

  @override
  State<IntroAuthScreen> createState() => _IntroAuthScreenState();
}



class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Welcome",
            body:"Welcome to FLOOMI , the best video conference app",
          image: Center(
            child: Image.asset('images/theteam.jpg',), //welcome.png

          ),
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20,Colors.black),
            titleTextStyle: mystyle(20,Colors.black),

          )
        ),

        PageViewModel(
            title: "Join or Start meetings",
            body:"Easy to use interface, Join our start meetings in fast time",
            image: Center(
              child: Image.asset('images/conference.png',height: 175,), // child: Image.asset('images/conference.png',height: 175,),

            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20,Colors.black),
              titleTextStyle: mystyle(20,Colors.black),

            )
        ),


        PageViewModel(
            title: "Security",
            body:"Your Security is important for us, Our servers are secure and reliable",
            image: Center(
              child: Image.asset('images/secure.jpg',height: 175,),

            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20,Colors.black),
              titleTextStyle: mystyle(20,Colors.black),

            ),
        )
      ],



    onDone: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigateAuthScreen()));
    },

    onSkip: (){
        print("Skip !!!");
    },

    showSkipButton: true,
    skip: const Icon(Icons.skip_next,size:45),
    next: const Icon(Icons.arrow_forward_ios),
    done: Text(
      "Done"
      ,style: mystyle(20,Colors.black),
    ),


    );
  }
}

















