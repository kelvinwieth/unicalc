import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicalc/models/calculation.dart';
import 'package:unicalc/utils/enums.dart';

abstract class Display {
  String get value;
  void clear();
  void appendValue(String value);
}

class Calculator {
  static Display? display;
  static String _buffer = '';
  static ButtonType? _operation;

  static void clearCalculations() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('history');
  }

  static Future<String> getHistory() async {
    var history = '';

    final calcs = await getCalculations();

    for (var calc in calcs) {
      history += calc.toString();
      history += '\n';
    }

    return history;
  }

  static void displayCalculations() async {
    debugPrint('##### START OF DISPLAYING CALCULATIONS #####');
    final calculations = await getCalculations();

    for (var calculation in calculations) {
      debugPrint(calculation.toString());
    }
    debugPrint('##### END OF DISPLAYING CALCULATIONS #####');
  }

  static Future<List<Calculation>> getCalculations() async {
    final prefs = await SharedPreferences.getInstance();
    final calculationStrings = prefs.getStringList('history');

    if (calculationStrings == null) {
      return [];
    }

    List<Calculation> calculations = [];

    for (var calculationString in calculationStrings) {
      final calculationJson = json.decode(calculationString) as Map<String, dynamic>;
      final calculation = Calculation.fromJson(calculationJson);
      calculations.add(calculation);
    }

    return calculations;
  }

  static void storeCalculation(Calculation calculation) async {
    var calculations = await getCalculations();
    calculations.add(calculation);

    List<String> calculationStrings = [];

    for (calculation in calculations) {
      final calculationString = json.encode(calculation.toJson());
      calculationStrings.add(calculationString);
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('history', calculationStrings);
  }

  static void press(ButtonType button) {
    if (button == ButtonType.clear) {
      display?.clear();
      _buffer = '';
      _operation = null;
      return;
    }

    if (button.isOperation) {
      if (display?.value.isEmpty ?? true) {
        if (button == ButtonType.minus) {
          display!.appendValue(button.describe);
        }
        return;
      }

      if (button == ButtonType.equals) {
        if (_operation == null) {
          return;
        }

        final firstNumber = double.tryParse(_buffer) ?? 0;
        final secondNumber = double.tryParse(display!.value) ?? 0;
        double result = 0;
        if (_operation == ButtonType.plus) {
          result = firstNumber + secondNumber;
        } else if (_operation == ButtonType.minus) {
          result = firstNumber - secondNumber;
        } else if (_operation == ButtonType.times) {
          result = firstNumber * secondNumber;
        } else if (_operation == ButtonType.division) {
          result = firstNumber / secondNumber;
        }

        display!.clear();
        display!.appendValue(result.toString());

        final calculation = Calculation(
          first: firstNumber,
          second: secondNumber,
          operation: _operation!.describe,
          result: result,
        );

        storeCalculation(calculation);

        return;
      }
      _buffer = display!.value;
      _operation = button;
      display!.clear();
      return;
    }

    if (button.isSeparator) {
      if (display?.value.contains(button.describe) ?? true) return;

      display?.appendValue(button.describe);
      return;
    }

    display?.appendValue(button.describe);
  }

  static void addDisplay(Display display) {
    Calculator.display = display;
  }
}
