import 'package:firebase_auth/firebase_auth.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: mystyle(17, Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: mystyle(17, Colors.black),
        currentIndex: page,
        onTap: (index){
          setState(() {
            page = index;
          });
        },
        items: const [                                                      // I added Const Here
          BottomNavigationBarItem(
            label: 'Video Call',
            icon: Icon(Icons.video_call,size:32,)
            ,),

          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person,size:32,)
            ,)



        ],
      ),
      body: InkWell(
        onTap: (){

          FirebaseAuth.instance.signOut();

        }
      ),

    );
  }
}





















