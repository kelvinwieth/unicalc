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
    return MaterialApp(
      home: Scaffold(
        body: const CalculatorWidget(),
        floatingActionButton: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: const Icon(Icons.history),
                onPressed: () {
                  Calculator.getHistory().then(
                    (history) => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Center(
                          child: Text(
                            history,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 5),
              FloatingActionButton(
                child: const Icon(Icons.delete),
                onPressed: () => Calculator.clearCalculations(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
