import 'package:flutter/material.dart';
import 'package:saptapti/Screens/Home/chat.dart';
import 'package:saptapti/Screens/Home/matches.dart';
import 'package:saptapti/Screens/Home/userHome.dart';
import 'package:saptapti/color.dart' as color;

import 'Home/Inbox/inbox.dart';
import 'Home/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.tabIndex = 0,
    this.index = 0,
  });

  final int tabIndex;
  final int index;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: DefaultTabController(
              initialIndex: widget.tabIndex,
              length: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: TabBar(
                        indicatorColor: color.body,
                        labelColor: color.black,
                        indicatorPadding: const EdgeInsets.all(1.0),
                        labelStyle: const TextStyle(
                          color: color.body2,
                        ),
                        unselectedLabelColor: color.darkGrey.withOpacity(0.7),
                        unselectedLabelStyle:
                            TextStyle(color: color.darkGrey.withOpacity(0.5)),
                        isScrollable: true,
                        tabs: const [
                          Tab(text: "Home", icon: Icon(Icons.home)),
                          Tab(text: "Matches", icon: Icon(Icons.copy)),
                          Tab(text: "Inbox", icon: Icon(Icons.inbox)),
                          // const Tab(text: "Chat", icon: Icon(Icons.chat)),
                          Tab(
                              text: "Notification",
                              icon: Icon(Icons.notification_important)),
                        ]),
                  ),
                  Container(
                    //Add this to give height
                    height: MediaQuery.of(context).size.height * 0.87,
                    // padding: EdgeInsets.only(bottom: ),
                    child: TabBarView(children: [
                      UserHome(),
                      Matches(),
                      Inbox(index: widget.index),
                      // Chat(),
                      NotificationScreen(),
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
