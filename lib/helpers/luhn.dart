/// Internal Luhn algorithm implementation used for RSA ID checksums.
class LuhnUtils {
  /// Returns `true` when [value] is all digits and satisfies Luhn validation.
  static bool validate(String value) {
    if (value.isEmpty || !_isDigitsOnly(value)) {
      return false;
    }

    final digits = value.codeUnits.map((char) => char - 48).toList();
    final checkDigit = digits.removeLast();
    return checksum(digits) == checkDigit;
  }

  /// Calculates the Luhn check digit for [digits].
  ///
  /// [digits] should represent the number without the trailing check digit.
  static int checksum(List<int> digits) {
    var sum = 0;
    var doubleDigit = true;

    for (var i = digits.length - 1; i >= 0; i--) {
      var value = digits[i];
      if (doubleDigit) {
        value *= 2;
        if (value > 9) {
          value -= 9;
        }
      }
      sum += value;
      doubleDigit = !doubleDigit;
    }

    return (10 - (sum % 10)) % 10;
  }

  static bool _isDigitsOnly(String value) {
    for (final codeUnit in value.codeUnits) {
      if (codeUnit < 48 || codeUnit > 57) {
        return false;
      }
    }
    return true;
  }
}
