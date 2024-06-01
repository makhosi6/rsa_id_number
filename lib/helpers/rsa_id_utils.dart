import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:luhn_algorithm/luhn_algorithm.dart';

/// Utility functions for manipulating and validating South African ID numbers.
class RsaIdUtils {
  /// Generates a random date of birth (YYMMDD) within a specified date range.
  ///
  /// The [maxDate] and [minDate] parameters define the date range for generating the birth date.
  /// Returns a string representing the generated date of birth.
  static String generateDate({DateTime? maxDate, DateTime? minDate}) {
    final fromDate = maxDate ?? DateTime(1920);
    final toDate = minDate ?? DateTime.now();

    if (fromDate.isAfter(toDate) == true ||
        fromDate.isAtSameMomentAs(toDate) == true) {
      throw "Invalid date range: maxDate should not be after minDate.";
    }

    final timeBetweenDates =
        toDate.subtract(Duration(days: toDate.difference(fromDate).inDays));

    final int daysBetweenDates = toDate.difference(fromDate).inDays;

    final int randomNumberOfDays = Random().nextInt(daysBetweenDates);
    final DateTime randomDate =
        timeBetweenDates.add(Duration(days: randomNumberOfDays));
    return DateFormat('yyMMdd').format(randomDate);
  }

  /// Generates a gender code (SSSS) based on the provided [gender].
  ///
  /// The [gender] parameter specifies the gender ('female' or 'male').
  /// Returns a string representing the generated gender code.
  static String generateGender(Gender? gender) {
    late int min;
    late int max;
    if (gender != null) {
      if (gender == Gender.FEMALE) {
        min = 0;
        max = 5000;
      } else if (gender == Gender.MALE) {
        min = 5000;
        max = 10000;
      }
    } else {
      min = 0;
      max = 10000;
    }

    final int randInt = Random().nextInt(max - min) + min;
    return randInt.toString().padLeft(4, '0');
  }

  /// Generates a citizenship code (C) based on the provided [citizenship].
  ///
  /// The [citizenship] parameter specifies the citizenship ('citizen' or 'resident').
  /// Returns a string representing the generated citizenship code.
  static String generateCitizenship([Citizenship? citizenship]) {
    if (citizenship == null) {
      return Random().nextBool() ? '0' : '1';
    } else {
      return citizenship.value;
    }
  }

  /// Appends a Luhn checksum digit (Z) to the input string.
  ///
  /// The [input] parameter is the string to which the checksum is appended.
  /// Returns the input string with the Luhn checksum digit appended.
  static String luhnAppend(String input) {
    final digits =
        input.codeUnits.map((char) => char - '0'.codeUnitAt(0)).toList();
    digits.add(luhnChecksum(digits));

    return utf8
        .decode(digits.map((digit) => digit + '0'.codeUnitAt(0)).toList());
  }

  /// Calculates the Luhn checksum for a list of digits (alternative implementation).
  ///
  /// The [digits] parameter is a list of digits for which the checksum is calculated.
  /// Returns the calculated Luhn checksum as an integer.
  static int luhnChecksum(List<int> digits) => Luhn.checksum(digits.join());

  /// Calculates the Luhn checksum for a list of digits (alternative implementation).
  ///
  /// The [digits] parameter is a list of digits for which the checksum is calculated.
  /// Returns the calculated Luhn checksum as an integer.
  @Deprecated('Use [luhnChecksum]')
  static int luhnChecksum2(List<int> digits) {
    int sum = 0;
    for (int i = digits.length - 1; i >= 0; i--) {
      int digit = digits[i];
      if ((digits.length - i).isEven) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
    }
    final checksum = (sum * 9) % 10;

    return checksum;
  }
}

enum Gender { FEMALE, MALE }

enum Citizenship {
  CITIZEN_BORN(value: '0'),
  CITIZEN_NOT_BORN(value: '1');

  const Citizenship({required this.value});

  final String value;
}
