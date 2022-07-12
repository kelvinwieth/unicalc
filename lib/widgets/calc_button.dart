import 'package:flutter/material.dart';
import 'package:unicalc/calculator.dart';
import 'package:unicalc/utils/enums.dart';

class CalcButton extends StatelessWidget {
  final ButtonType button;

  const CalcButton({
    Key? key,
    required this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
          child: Text(
            button.describe,
            style: const TextStyle(fontSize: 20),
          ),
          onPressed: () => Calculator.press(button),
        ),
      ),
    );
  }
}
