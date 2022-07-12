enum ButtonType {
  none,
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
  clear,
}

extension ButtonTypeExtension on ButtonType {
  static final _numbers = [
    ButtonType.dot,
    ButtonType.zero,
    ButtonType.one,
    ButtonType.two,
    ButtonType.three,
    ButtonType.four,
    ButtonType.five,
    ButtonType.six,
    ButtonType.seven,
    ButtonType.eight,
    ButtonType.nine,
  ];

  static final _operations = [
    ButtonType.plus,
    ButtonType.minus,
    ButtonType.times,
    ButtonType.division,
    ButtonType.equals,
  ];

  bool get isOperation => _operations.contains(this);

  bool get isNumber => _numbers.contains(this);

  bool get isSeparator => ButtonType.dot == this;

  String get describe {
    switch (this) {
      case ButtonType.none:
        return '';
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
      case ButtonType.clear:
        return 'C';
    }
  }
}
