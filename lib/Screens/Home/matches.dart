import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saptapti/util.dart';
import 'package:saptapti/color.dart' as color;

import '../../Controller/getMatchesController.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

GetMatchesController controller = Get.put(GetMatchesController());

class _MatchesState extends State<Matches> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await controller.getDefaultMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => getData(),
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                await controller.getDefaultMatches();
                              },
                              child: const Card(
                                color: color.body,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "All Profile",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                await controller.getMatches();
                              },
                              child: const Card(
                                color: color.body,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Matches Profile",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                await controller.getNearMe();
                              },
                              child: const Card(
                                color: color.body,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Near Me Profile",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: controller.matches.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 300,
                              margin:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: color.body.withOpacity(0.2)),
                                  color: color.body,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(controller
                                          .matches[index]['photo1']
                                          .toString()))),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: InkWell(
                                      onTap: () async {
                                        String res =
                                            await controller.sendRequest(
                                                controller.matches[index]["id"],
                                                context);

                                        Get.snackbar(
                                          res,
                                          "",
                                          colorText: Colors.white,
                                          backgroundColor: color.body,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: color.body,
                                            border:
                                                Border.all(color: Colors.white),
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
                                                  Icons.telegram,
                                                  size: 15,
                                                  color: color.body,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Send Request",
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
                                    bottom: 50,
                                    left: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: color.body,
                                          border:
                                              Border.all(color: Colors.white),
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
                                                Icons.call,
                                                size: 15,
                                                color: color.body,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "mobile",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 90,
                                    left: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: color.body,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Name",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            controller.matches[index]
                                                    ['firstname'] +
                                                controller.matches[index]
                                                    ['lastname'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 130,
                                    left: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: color.body,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.matches[index]['birthdate'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Quick Links",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.support_agent,
                                        color: color.body,
                                      ),
                                      Text(
                                        "Customer Support",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: color.body,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.logout_outlined,
                                        color: color.body,
                                      ),
                                      Text(
                                        "Log Out",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: color.body,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
