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

  static void press(ButtonType button) {
    if (button == ButtonType.clear) {
      display?.clear();
      _buffer = '';
      _operation = null;
      return;
    }

    if (button.isOperation) {
      if (display?.value.isEmpty ?? true) {
        return;
      }

      if (button == ButtonType.equals) {
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
