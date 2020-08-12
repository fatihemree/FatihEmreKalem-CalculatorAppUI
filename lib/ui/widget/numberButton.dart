import 'package:calculatorUI/ui/widget/style/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalcButton extends StatefulWidget {
  final String number;
  final bool iSnumber;

  CalcButton(this.number, [this.iSnumber = true]);

  @override
  _CalcButtonState createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {
  @override
  Widget build(BuildContext context) {
    return widget.number != "="
        ? Expanded(child: buttonBox)
        : Expanded(flex: 2, child: buttonBox);
  }

  Widget get buttonBox => InkWell(
        onTap: () {
          print(widget.number);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white24, width: 0.1),
              color: colorBg()),
          child: Center(child: widget.number == "Del" ? backspace : numberText),
        ),
      );

  Widget get backspace => Icon(Icons.backspace, color: blue);

  Widget get numberText => Text(
        widget.number,
        style: colorText(),
      );

  Color colorBg() {
    if (widget.number == "=") {
      return blue;
    } else if (!validationNumber(widget.number)) {
      return black50;
    } else {
      return black;
    }
  }

  TextStyle colorText() {
    if (widget.number == "=") {
      return textWhite;
    } else if (validationNumber(widget.number)) {
      return textWhite;
    } else if (validationOperatorFeatures(widget.number)) {
      return textGrey;
    } else {
      return textBlue;
    }
  }

  TextStyle textWhite = TextStyle(color: white, fontSize: 38);

  TextStyle textBlue = TextStyle(color: blue, fontSize: 38);

  TextStyle textGrey = TextStyle(color: grey, fontSize: 38);

  bool validationNumber(String value) {
    String pattern = r'^(?=.*?[0-9,%])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validationOperator(String value) {
    String pattern = r'^(?=.*?[+-/x÷cDel])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validationOperatorFeatures(String value) {
    String pattern = 'm';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
