import 'package:flutter/material.dart';
import 'ui/widget/numberButton.dart';
import 'ui/widget/style/color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: black,
        body: calculatorApp,
      ),
    );
  }

  Widget get calculatorApp => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: calcScreen,
              flex: 2,
            ),
            Flexible(
              child: calcKeyGrid,
              flex: 5,
            ),
          ],
        ),
      );
  Widget get calcScreen => Container(
        color: black,
        // child: TextField(),
      );

  Widget get calcKeyGrid => Container(
        child: Row(
          children: [
            columnGrid(["mc", "c", "7", "4", "1", "%"]),
            columnGrid(["m+", "÷", "8", "5", "2", "0"]),
            columnGrid(["m-", "x", "9", "6", "3", ","]),
            columnGrid(["mr", "Del", "-", "+", "="]),
          ],
        ),
      );

  Widget columnGrid(button) => Expanded(
        child: Column(
          children: List.generate(
            button.length,
            (index) => CalcButton(button[index]),
          ),
        ),
      );
}
