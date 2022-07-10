import 'package:flutter/material.dart';
import 'package:unicalc/utils/enums.dart';
import 'package:unicalc/widgets/calc_button.dart';
import 'package:unicalc/widgets/calc_display.dart';

class CalculatorWidget extends StatelessWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CalcDisplay(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CalcButton(button: ButtonType.seven),
            CalcButton(button: ButtonType.eight),
            CalcButton(button: ButtonType.nine),
            CalcButton(button: ButtonType.division),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CalcButton(button: ButtonType.four),
            CalcButton(button: ButtonType.five),
            CalcButton(button: ButtonType.six),
            CalcButton(button: ButtonType.times),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CalcButton(button: ButtonType.one),
            CalcButton(button: ButtonType.two),
            CalcButton(button: ButtonType.three),
            CalcButton(button: ButtonType.minus),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CalcButton(button: ButtonType.zero),
            CalcButton(button: ButtonType.dot),
            CalcButton(button: ButtonType.plus),
            CalcButton(button: ButtonType.equals),
          ],
        ),
      ],
    );
  }
}
