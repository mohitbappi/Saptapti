import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/color.dart' as color;

import '../../../Controller/ConnectReceivedController.dart';

class ConnectReceived extends StatefulWidget {
  const ConnectReceived({super.key});

  @override
  State<ConnectReceived> createState() => _ConnectReceivedState();
}

ConnectReceivedController controller = Get.put(ConnectReceivedController());

class _ConnectReceivedState extends State<ConnectReceived> {
  @override
  Widget build(BuildContext context) {
    return controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: controller.request.isEmpty
                ? Center(
                    child: Text("No Data Found"),
                  )
                : ListView.builder(
                    itemCount: controller.request.length,
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
                                    controller.request[index]['photo1']))),
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: InkWell(
                                onTap: () async {
                                  await controller.sendUpdate("1", context);
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
                                  await controller.sendUpdate("2", context);
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
                                    borderRadius: BorderRadius.circular(20.0)),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Request Date:  ${controller.request[index]['request_date']}",
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
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Age: ${controller.request[index]['birthdate']}",
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
                                    borderRadius: BorderRadius.circular(20.0)),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Name: ${controller.request[index]['firstname']}  ${controller.request[index]['lastname']}",
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
