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
      child: ElevatedButton(
        onPressed: () {
          Calculator.press(button);
        },
        child: Text(button.describe),
      ),
    );
  }
}
