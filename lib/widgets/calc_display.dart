import 'package:flutter/material.dart';
import 'package:unicalc/calculator.dart';

class CalcDisplay extends StatefulWidget {
  const CalcDisplay({Key? key}) : super(key: key);

  @override
  State<CalcDisplay> createState() => _CalcDisplayState();
}

class _CalcDisplayState extends State<CalcDisplay> implements Display {
  String _value = '';

  _CalcDisplayState() {
    Calculator.addDisplay(this);
    Calculator.displayCalculations();
  }

  @override
  String get value => _value;

  @override
  void clear() {
    setState(() {
      _value = '';
    });
  }

  @override
  void appendValue(String value) {
    setState(() {
      _value += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
