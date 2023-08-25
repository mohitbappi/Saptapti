import 'package:flutter/material.dart';
import 'package:saptapti/Screens/Home/Inbox/viewed_profile.dart';
import 'package:saptapti/util.dart';
import 'package:saptapti/color.dart' as color;

import 'accepted.dart';
import 'connectReceived.dart';
import 'connectSent.dart';
import 'viewedMe.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key, this.index = 0});

  final int index;

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  Widget _tabSection() {
    return DefaultTabController(
      length: 4,
      initialIndex: widget.index,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: const TabBar(
                indicatorColor: color.body,
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: [
                  Tab(text: "Connect Received"),
                  Tab(text: "Accepted"),
                  Tab(text: "Connect Sent"),
                  Tab(text: "Viewed Profile"),
                  // Tab(text: "Viewed Me"),
                ]),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: const TabBarView(children: [
              ConnectReceived(),
              Accepted(),
              ConnectSent(),
              ViewedProfileScreen(),
              // ViewwedMe(),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _tabSection(),
          ],
        ),
      ),
    );
  }
}
