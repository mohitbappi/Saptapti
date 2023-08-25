import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/Screens/Home/user_profile.dart';
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/color.dart' as color;
import 'package:http/http.dart' as http;

import '../../../Controller/ConnectReceivedController.dart';

class ConnectReceived extends StatefulWidget {
  const ConnectReceived({super.key});

  @override
  State<ConnectReceived> createState() => _ConnectReceivedState();
}

ConnectReceivedController controller = Get.put(ConnectReceivedController());

class _ConnectReceivedState extends State<ConnectReceived> {
  bool _isLoading = false;
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    getRequest();
  }

  getRequest() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/get_request");

      String id = await SharedPrefs.getUserId() ?? "";
      var map = <String, dynamic>{};
      map['user_id'] = id;

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        setState(() {
          _isLoading = false;
        });

        if (responseData['response'] == 'no request found') {
          data = [];
        } else {
          data.addAll(responseData['response']);
        }
      } else {
        return response.body;
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _onNavigateToDetail(String id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => UserProfileScreen(
          userId: id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: data.isEmpty
                ? Center(
                    child: Text("No Data Found"),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 150),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () =>
                            _onNavigateToDetail(data[index]['to_user_id']),
                        child: Container(
                          height: 300,
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          decoration: BoxDecoration(
                              color: color.body,
                              border: Border.all(
                                color: color.body,
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(data[index]['photo1']))),
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: InkWell(
                                  onTap: () async {
                                    await controller.sendUpdate("1", context,
                                        data[index]['request_id']);
                                    await getRequest();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: color.body,
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 10,
                                          child: Center(
                                            child: Icon(
                                              Icons.done_rounded,
                                              size: 15,
                                              color: color.body,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Accept",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: InkWell(
                                  onTap: () async {
                                    await controller.sendUpdate("2", context,
                                        data[index]['request_id']);
                                    await getRequest();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: color.body,
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 10,
                                          child: Center(
                                            child: Icon(
                                              Icons.cancel,
                                              size: 15,
                                              color: color.body,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Reject",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 60,
                                left: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Request Date:  ${data[index]['request_date']}",
                                    style: TextStyle(
                                        color: color.body,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 110,
                                left: 10,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Age: ${data[index]['birthdate']}",
                                        style: TextStyle(
                                            color: color.body,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.white,
                                    //       border: Border.all(color: Colors.white),
                                    //       borderRadius: BorderRadius.circular(20.0)),
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: const Text(
                                    //     "Height: 4'11''",
                                    //     style: TextStyle(
                                    //         color: color.body,
                                    //         fontWeight: FontWeight.bold),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 160,
                                left: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Name: ${data[index]['firstname']}  ${data[index]['lastname']}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: color.body,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          );
  }
}
