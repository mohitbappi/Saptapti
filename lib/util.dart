import 'package:flutter/material.dart';
import 'package:saptapti/color.dart' as color;

class util {
  Widget inputTextfield({
    required hint,
    required label,
    required controller,
    keybordType,
    password,
    enableInteractive,
    Picon,
    errorMessage = '',
    errorColor = Colors.red,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 500,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0)),
          child: Center(
            child: TextField(
              controller: controller,
              keyboardType: keybordType ?? TextInputType.streetAddress,
              obscureText: password ?? false,
              enableInteractiveSelection: enableInteractive ?? true,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(Picon) ?? Icon(Icons.keyboard),
                hintText: hint,
                labelText: label,
                border: InputBorder.none,
                errorStyle: TextStyle(color: errorColor),
              ),
            ),
          ),
        ),
        if (errorMessage != '') const SizedBox(height: 5),
        Text(
          errorMessage != '' ? errorMessage : '',
          style: TextStyle(
            color: errorColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget simpleButton(width, text, colors, [double height = 55]) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.white,
          offset: const Offset(
            0.0,
            0.0,
          ),
          blurRadius: 0.0,
          spreadRadius: 0.2,
        ), //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ), //BoxShadow
      ], color: colors, borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Text simpleText(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Text smallText(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.blueGrey, fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  BoxDecoration decore(shape) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(0
          // global.selectShapeType[shape] == 'Square' ? 0 : 100

          ),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(
            1.0,
            1.0,
          ),
          blurRadius: 1,
          spreadRadius: 0.2,
        ), //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ), //BoxShadow
      ],
    );
  }

  showSnackBar(context, text, color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 200.0),
        duration: const Duration(seconds: 3),
        backgroundColor: color,
      ),
    );
  }

  appBar(text) {
    return AppBar(
      title: Text(text),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.blue.withOpacity(0.5),
              Colors.green.withOpacity(0.5)
            ],
          ),
        ),
      ),
    );
  }

  void showYourPopUp(context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("AlertDialog"),
              content: Text(
                  "Would you like to continue learning how to use Flutter alerts?"),
              backgroundColor: Colors.grey,
            ));
  }

  Widget bottomBar(context) {
    return Container(
      height: 70,
      color: color.body,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Contact us | tearms & Conditions | Privacy Policy | FAQ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.copyright,
                size: 17,
                color: Colors.white,
              ),
              Text(
                " CopyRight 2023 by KoliSaptapadi. All Rights Reserved",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DualRadioButtonCard extends StatefulWidget {
  final title;
  final option;
  final btnValue;
  final onChanged;
  final group;

  DualRadioButtonCard({
    Key? key,
    required this.title,
    required this.option,
    required this.btnValue,
    required this.group,
    required this.onChanged,
  }) : super(key: key);

  @override
  DualRadioOptionCardState createState() => DualRadioOptionCardState();
}

class DualRadioOptionCardState extends State<DualRadioButtonCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
            activeColor: Theme.of(context).primaryColor,
            value: widget.option[widget.btnValue],
            groupValue: widget.group,
            onChanged: widget.onChanged),
        Text(widget.title)
      ],
    );
  }
}
