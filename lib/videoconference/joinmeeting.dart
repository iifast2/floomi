//import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floom/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
//import 'package:basic_utils/basic_utils.dart';  // for exceptions

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({Key? key}) : super(key: key);

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController roomcontroller = TextEditingController();

  // everything default = true
  bool isVideoMuted = true;
  bool isAudioMuted = true;
  String username = '';

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
      username = userdoc['username'] ?? '';
      // Solved: https://stackoverflow.com/a/72699569
    });
  }

  joinmeeting() async {
    //try{
    // Map<FeatureFlagEnum, bool> featureFlags = {
    //   FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    // };
    // if (Platform.isAndroid) {
    //   featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
    // } else if (Platform.isIOS) {
    //   featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
    // }

    var options = JitsiMeetingOptions(room: roomcontroller.text)
      ..userDisplayName =
          namecontroller.text == '' ? username : namecontroller.text
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      // ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": roomcontroller.text,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": namecontroller.text}
      };

    await JitsiMeet.joinMeeting(options);
  }

/*  } catch (e) {
  print("Error: $e");
  }*/

//13.46
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Room Code",
                      style: mystyle(20),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PinCodeTextField(
                      controller: roomcontroller,
                      length: 6,
                      autoDisposeControllers: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      onChanged: (value) {},

                      appContext:
                          context, // since the PinCodeTextField() is spitting out errors - so I added appContext: context,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                        controller: namecontroller,
                        style: mystyle(20),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:
                                "Name ( Leave if you want your username )",
                            labelStyle: mystyle(15))),
                    const SizedBox(
                      height: 16,
                    ),
                    CheckboxListTile(
                      value: isVideoMuted,
                      onChanged: (value) {
                        setState(() {
                          isVideoMuted = value!;
                        });
                      },
                      title: Text(
                        "Video Muted",
                        style: mystyle(18, Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CheckboxListTile(
                      value: isAudioMuted,
                      onChanged: (value) {
                        setState(() {
                          isAudioMuted = value!;
                        });
                      },
                      title: Text(
                        "Audio Muted",
                        style: mystyle(18, Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Of course you can customise your settings in the meetings",
                      style: mystyle(15),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      height: 48,
                      thickness: 2.0,
                    ),
                    InkWell(
                      onTap: () => joinmeeting(),
                      child: Container(
                        width: double.maxFinite,
                        height: 64,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: GradientColors.meanFruit)),
                        child: Center(
                          child: Text(
                            "Join Meeting",
                            style: mystyle((20), Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                width: width * 0.60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      color: Colors.white54,
                      child: SizedBox(
                        width: width * 0.70 * 0.80,
                        height: width * 0.70 * 0.80,
                        child: JitsiMeetConferencing(
                          extraJS: [
                            // extraJs setup example
                            '<script>function echo(){console.log("echo!!!")};</script>',
                            '<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>'
                          ],
                        ),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
