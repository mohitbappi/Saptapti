import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/color.dart' as color;

import '../../../Controller/AcceptedController.dart';

class Accepted extends StatefulWidget {
  const Accepted({super.key});

  @override
  State<Accepted> createState() => _AcceptedState();
}

AcceptedController controller = Get.put(AcceptedController());

class _AcceptedState extends State<Accepted> {
  @override
  Widget build(BuildContext context) {
    return controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: controller.accepted.isEmpty
                ? Center(
                    child: Text("No Data Found"),
                  )
                : ListView.builder(
                    itemCount: controller.accepted.length,
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
                                    controller.accepted[index]['photo1']))),
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
                                  "accepted Date:  ${controller.accepted[index]['request_date']}",
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
                                      "Age: ${controller.accepted[index]['birthdate']}",
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
                                  "Name: ${controller.accepted[index]['firstname']}  ${controller.accepted[index]['lastname']}",
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
