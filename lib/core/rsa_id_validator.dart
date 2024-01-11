import 'package:luhn_algorithm/luhn_algorithm.dart';
import 'package:meta/meta.dart';

/// Validates South African ID numbers based on specified rules.
class RsaIdValidator {
  /// Checks if the provided [idNumber] is a valid South African ID number.
  ///
  /// Returns `true` if the [idNumber] is valid; otherwise, returns `false`.
  static bool isValid(String idNumber) {
    if (idNumber.length != 13) {
      return false;
    }

    final yymmdd = idNumber.substring(0, 6);
    final sequentialNumber = idNumber.substring(6, 10);
    final citizenship = idNumber.substring(10, 11);
    // String checksumDigit = idNumber.substring(12, 13);

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

  /// Validates the date part (YYMMDD) of a South African ID number.
  ///
  /// Returns `true` if the date is valid; otherwise, returns `false`.
  @visibleForTesting
  static bool isValidDate(String yymmdd) {
    final year = int.parse(yymmdd.substring(0, 2));
    final month = int.parse(yymmdd.substring(2, 4));
    final day = int.parse(yymmdd.substring(4, 6));

    if (year < 0 || month < 1 || month > 12 || day < 1 || day > 31) {
      return false;
    }

    return true;
  }

  /// Validates the sequential number part (SSSS) of a South African ID number.
  ///
  /// Returns `true` if the sequential number is valid; otherwise, returns `false`.
  @visibleForTesting
  static bool isValidSequentialNumber(String sequentialNumber) {
    final sequentialDigit = int.parse(sequentialNumber);
    return sequentialDigit >= 0 && sequentialDigit <= 9999;
  }

  /// Validates the citizenship part (C) of a South African ID number.
  ///
  /// Returns `true` if the citizenship code is valid; otherwise, returns `false`.
  @visibleForTesting
  static bool isValidCitizenship(String citizenship) {
    return citizenship == '0' || citizenship == '1';
  }

  /// Validates the checksum part (Z) of a South African ID number using the Luhn algorithm.
  ///
  /// Returns `true` if the checksum is valid; otherwise, returns `false`.
  @visibleForTesting
  static bool isValidChecksum(String idNumber) => Luhn.validate(idNumber);
}
