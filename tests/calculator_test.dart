import 'package:flutter_test/flutter_test.dart';
import 'package:unicalc/calculator.dart';
import 'package:unicalc/utils/enums.dart';

void main() {
  group('Divide', () {
    const operation = ButtonType.division;

    test('0 by 0, should return NaN', () {
      // Arrange
      const first = 0.0;
      const second = 0.0;
      const expected = true;

      // Act
      final result = Calculator.calculate(first, second, operation);

      // Assert
      expect(result.isNaN, expected);
    });

    test('0 by 1, should return 0', () {
      // Arrange
      const first = 0.0;
      const second = 1.0;
      const expected = 0.0;

      // Act
      final result = Calculator.calculate(first, second, operation);

      // Assert
      expect(result, expected);
    });

    test('1 by 0, should return Infinity', () {
      // Arrange
      const first = 1.0;
      const second = 0.0;
      const expected = double.infinity;

      // Act
      final result = Calculator.calculate(first, second, operation);

      // Assert
      expect(result, expected);
    });

    test('1 by 1, should return 1', () {
      // Arrange
      const first = 1.0;
      const second = 1.0;
      const expected = 1.0;

      // Act
      final result = Calculator.calculate(first, second, operation);

      // Assert
      expect(result, expected);
    });

    test('1 by 2, should return 0.5', () {
      // Arrange
      const first = 1.0;
      const second = 2.0;
      const expected = 0.5;

      // Act
      final result = Calculator.calculate(first, second, operation);

      // Assert
      expect(result, expected);
    });
  });
}
