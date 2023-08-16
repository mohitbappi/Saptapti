import 'package:flutter/material.dart';
import 'package:saptapti/color.dart' as color;
import 'package:saptapti/util.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  void _onSendEmail(BuildContext context, String emailId) async {
    String email = Uri.encodeComponent(emailId);
    Uri mail = Uri.parse("mailto:$email");

    try {
      await launchUrl(mail);
    } catch (err) {
      util().showSnackBar(
        context,
        'Email app is not opened',
        Colors.red,
      );
    }
  }

  void _onDialNumber(BuildContext context, String mobileNo) async {
    String mobile = Uri.encodeComponent(mobileNo);
    Uri dialNumber = Uri.parse("tel:$mobile");

    try {
      await launchUrl(dialNumber);
    } catch (err) {
      util().showSnackBar(
        context,
        'Dial app is not opened',
        Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: color.body,
      ),
      body: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.body,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact us if you have any concerns we will get in touch with 24 hours',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => _onDialNumber(context, '9760975757'),
              child: const Text(
                'Mobile No.: 9760975757',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _onSendEmail(context, 'kolisaptapadi@gmail.com'),
              child: const Text(
                'Email: kolisaptapadi@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
