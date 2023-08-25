import 'package:flutter/material.dart';
import 'package:saptapti/color.dart' as color;
import 'package:saptapti/util.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _amount = TextEditingController();
  bool _isError = false;

  @override
  void dispose() {
    super.dispose();
    _amount.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: color.body1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            util().simpleText(
                'Note: right now we are giving membership to premium users please contact on below email or mobile number for the membership plan advantage of taking membership for 1 year you get contact number of premium member'),
            const SizedBox(height: 5),
            util().simpleText('Email: kolisaptapadi@gmail.com'),
            const SizedBox(height: 5),
            util().simpleText('Mobile: 9760975757'),
            const SizedBox(height: 150),
            util().simpleText("Membership fee 500 inr"),
            // const SizedBox(height: 10),
            // util().inputTextfield(
            //   hint: 'Amount',
            //   label: 'Amount',
            //   controller: _amount,
            //   errorMessage: (_isError && (int.tryParse(_amount.text) ?? 0) <= 0)
            //       ? 'Please enter amount'
            //       : '',
            // ),
            // Expanded(
            //   child: GestureDetector(
            //     onTap: () {
            //       if ((int.tryParse(_amount.text) ?? 0) > 0) {
            //         setState(() {
            //           _isError = false;
            //         });
            //       } else {
            //         setState(() {
            //           _isError = true;
            //         });
            //       }
            //     },
            //     child: Align(
            //       alignment: FractionalOffset.bottomCenter,
            //       child: util().simpleButton(
            //         500.0,
            //         "Pay",
            //         Colors.blueGrey,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
