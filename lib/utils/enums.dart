enum ButtonType {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  plus,
  minus,
  times,
  division,
  equals,
  dot,
}

extension ButtonTypeExtension on ButtonType {
  String get describe {
    switch (this) {
      case ButtonType.zero:
        return '0';
      case ButtonType.one:
        return '1';
      case ButtonType.two:
        return '2';
      case ButtonType.three:
        return '3';
      case ButtonType.four:
        return '4';
      case ButtonType.five:
        return '5';
      case ButtonType.six:
        return '6';
      case ButtonType.seven:
        return '7';
      case ButtonType.eight:
        return '8';
      case ButtonType.nine:
        return '9';
      case ButtonType.plus:
        return '+';
      case ButtonType.minus:
        return '-';
      case ButtonType.times:
        return '*';
      case ButtonType.division:
        return '/';
      case ButtonType.equals:
        return '=';
      case ButtonType.dot:
        return '.';
    }
  }
}
