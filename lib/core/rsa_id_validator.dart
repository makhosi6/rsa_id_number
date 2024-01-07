import 'package:luhn_algorithm/luhn_algorithm.dart';
import 'package:meta/meta.dart';

class RsaIdValidator {
  static bool isValid(String idNumber) {
    if (idNumber.length != 13) {
      return false;
    }

    String yymmdd = idNumber.substring(0, 6);
    String sequentialNumber = idNumber.substring(6, 10);
    String citizenship = idNumber.substring(10, 11);
    String checksumDigit = idNumber.substring(12, 13);

    if (!isValidDate(yymmdd)) {
      return false;
    }

    if (!isValidSequentialNumber(sequentialNumber)) {
      return false;
    }

    if (!isValidCitizenship(citizenship)) {
      return false;
    }

    if (!isValidChecksum(idNumber)) {
      return false;
    }

    return true;
  }

  @visibleForTesting
  static bool isValidDate(String yymmdd) {
    int year = int.parse(yymmdd.substring(0, 2));
    int month = int.parse(yymmdd.substring(2, 4));
    int day = int.parse(yymmdd.substring(4, 6));

    if (year < 0 || month < 1 || month > 12 || day < 1 || day > 31) {
      return false;
    }

    return true;
  }

  @visibleForTesting
  static bool isValidSequentialNumber(String sequentialNumber) {
    int sequentialDigit = int.parse(sequentialNumber);
    return (sequentialDigit >= 0 && sequentialDigit <= 9999);
  }

  @visibleForTesting
  static bool isValidCitizenship(String citizenship) {
    return citizenship == '0' || citizenship == '1';
  }

  @visibleForTesting
  static bool isValidChecksum(String idNumber) {
    return Luhn.validate(idNumber);
  }
}
