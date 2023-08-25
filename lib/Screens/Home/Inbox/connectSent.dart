import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/Screens/Home/user_profile.dart';
import 'package:saptapti/SharedPrefs/sharedprefs.dart';
import 'package:saptapti/color.dart' as color;
import 'package:http/http.dart' as http;

import '../../../Controller/ConnectSentController.dart';

class ConnectSent extends StatefulWidget {
  const ConnectSent({super.key});

  @override
  State<ConnectSent> createState() => _ConnectSentState();
}

ConnectionSentController controller = Get.put(ConnectionSentController());

class _ConnectSentState extends State<ConnectSent> {
  bool _isLoading = false;
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    getConnect();
  }

  getConnect() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var url = Uri.parse("https://kolisaptapadi.in/Api/connect_sent");

      String id = await SharedPrefs.getUserId() ?? "";
      var map = <String, dynamic>{};
      map['user_id'] = id;

      var response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        if (responseData['response'] == 'no request found') {
          data = [];
        } else {
          data.addAll(responseData['response']);
        }

        setState(() {
          _isLoading = false;
        });
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

      print(e.toString());
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
                                bottom: 20,
                                left: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "connect Date:  ${data[index]['request_date']}",
                                    style: TextStyle(
                                        color: color.body,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 70,
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
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 120,
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
