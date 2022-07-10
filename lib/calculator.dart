import 'package:unicalc/utils/enums.dart';

class Calculator {
  static Display? display;

  static void press(ButtonType button) {
    if (_buttonIsOperation(button)) {
      return;
    }

    if (button == ButtonType.dot) {
      if (display?.value.contains(button.describe) ?? true) return;

      display?.appendValue(button.describe);
      return;
    }

    display?.appendValue(button.describe);
  }

  static bool _buttonIsOperation(ButtonType button) {
    const operations = [
      ButtonType.plus,
      ButtonType.minus,
      ButtonType.times,
      ButtonType.division,
    ];

    return operations.contains(button);
  }

  static void addDisplay(Display display) {
    Calculator.display = display;
  }
}

abstract class Display {
  String get value;
  void addValue(String value);
  void appendValue(String value);
}
