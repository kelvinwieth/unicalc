import 'package:flutter/material.dart';
import 'package:unicalc/calculator.dart';
import 'package:unicalc/widgets/calculator_widget.dart';

void main() {
  final calculator = Calculator();
  runApp(UniCalc(calculator: calculator));
}

class UniCalc extends StatelessWidget {
  final Calculator calculator;
  const UniCalc({
    Key? key,
    required this.calculator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: CalculatorWidget(),
      ),
    );
  }
}
