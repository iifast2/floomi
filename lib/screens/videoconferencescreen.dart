import 'package:floom/videoconference/joinmeeting.dart';
import 'package:flutter/material.dart';
import 'package:floom/variables.dart';

import '../videoconference/createmeeting.dart';


class VideoConferenceScreen extends StatefulWidget {
  const VideoConferenceScreen({Key? key}) : super(key: key);

  @override
  State<VideoConferenceScreen> createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> with SingleTickerProviderStateMixin { // we have to add it since we used tlate he tabBar
  late TabController tabController;
  // I added late here on TabController

  buildtab(String name) {
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text(name,style: mystyle(15, Colors.black, FontWeight.w700)),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,     // Here is the background color
        title: Text(
          "Floomi",
          style: mystyle(20, Colors.white, FontWeight.w700),
        ), // Text

        bottom: TabBar(
          controller: tabController ,
          tabs: [
            buildtab("Join Meeting"),
            buildtab("Create Meeting"),

          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: const [
        JoinMeeting(),
        CreateMeeting(),
      ]),
    );
  }
}


// https://androidride.com/flutter-container-background-color/