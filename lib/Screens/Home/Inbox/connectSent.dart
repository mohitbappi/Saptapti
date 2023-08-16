import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/color.dart' as color;

import '../../../Controller/ConnectSentController.dart';

class ConnectSent extends StatefulWidget {
  const ConnectSent({super.key});

  @override
  State<ConnectSent> createState() => _ConnectSentState();
}

ConnectionSentController controller = Get.put(ConnectionSentController());

class _ConnectSentState extends State<ConnectSent> {
  @override
  Widget build(BuildContext context) {
    return controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: controller.connect.isEmpty
                ? Center(
                    child: Text("No Data Found"),
                  )
                : ListView.builder(
                    itemCount: controller.connect.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 300,
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        decoration: BoxDecoration(
                            color: color.body,
                            border: Border.all(
                              color: color.body,
                            ),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    controller.connect[index]['photo1']))),
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
                                    borderRadius: BorderRadius.circular(20.0)),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "connect Date:  ${controller.connect[index]['request_date']}",
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
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Age: ${controller.connect[index]['birthdate']}",
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
                                    borderRadius: BorderRadius.circular(20.0)),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Name: ${controller.connect[index]['firstname']}  ${controller.connect[index]['lastname']}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: color.body,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          );
  }
}
