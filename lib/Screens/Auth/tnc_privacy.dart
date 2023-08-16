import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'package:saptapti/global.dart' as global;
import 'package:saptapti/color.dart' as color;

class TncAndPrivacyScreen extends StatefulWidget {
  const TncAndPrivacyScreen({
    super.key,
    required this.headerTitle,
    required this.isTnc,
  });

  final String headerTitle;
  final bool isTnc;

  @override
  State<TncAndPrivacyScreen> createState() => _TncAndPrivacyScreenState();
}

class _TncAndPrivacyScreenState extends State<TncAndPrivacyScreen> {
  String data = '';

  @override
  void initState() {
    super.initState();
    getTnC();
  }

  void getTnC() async {
    var url = Uri.parse(global.baseURL + global.contactUs);
    final res = await http.get(url);
    final responseData = json.decode(res.body);

    if (responseData['status']) {
      if (widget.isTnc) {
        setState(() {
          data = responseData['respone'][1]['content'];
        });
      } else {
        setState(() {
          data = responseData['respone'][0]['content'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle),
        backgroundColor: color.body,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: HtmlWidget(data),
      ),
      backgroundColor: Colors.white,
    );
  }
}
