import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floom/auth/navigateauthscreen.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = '';
  bool dataisthere = false;
  TextEditingController usernamecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  getuserdata() async {
    DocumentSnapshot userdoc =
        await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();
    setState(() {
      username = userdoc['username'] ??
          ''; // Solved: https://stackoverflow.com/a/72699569
      dataisthere = true;
    });
  }

  editprofile() async {
    usercollection
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({'username': usernamecontroller.text});

    setState(() {
      username = usernamecontroller.text;
    });
    Navigator.pop(context);
  }

  openeditprofiledialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: Container(
            height: 200,
            child: Column(
              children: [
                // I added a Const
                const SizedBox(
                  height: 30,
                ),
                //  TextField(style: mystyle(18),Colors.black),    // I added cursorColor
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: usernamecontroller,
                    style: mystyle(18),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Update Username",
                      labelStyle: mystyle(16, Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => editprofile(),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 40,
                    decoration: const BoxDecoration(
                        gradient:
                            LinearGradient(colors: GradientColors.juicyOrange)),
                    // color: marbleWall
                    child: Center(
                        child: Text("Update Now!",
                            style: mystyle(
                                17)) // , Colors.white // I couldn't add them

                        ),
                  ),
                )
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    //var face;
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: dataisthere == false
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  //import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: const BoxDecoration(
                      // I added Const here
                      gradient: LinearGradient(
                          colors: GradientColors.facebookMessenger),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2 - 64,
                    top: MediaQuery.of(context).size.height / 3.1,
                  ),
                  child: const CircleAvatar(
                    // I added Const here
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/1177/1177568.png'), // credit : Freepik.com
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 300,
                      ),
                      Text(
                        username,
                        style: mystyle(40, Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => openeditprofiledialog(),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 40,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: GradientColors.meanFruit)),
                          child: Center(
                              child: Text("Edit Profile",
                                  style: mystyle(
                                      17)) // , Colors.white // I couldn't add them

                              ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      InkWell(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigateAuthScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 40,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: GradientColors.meanFruit)),
                          child: Center(
                            child: Text(
                              "Logout",
                              style: mystyle((20), Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
