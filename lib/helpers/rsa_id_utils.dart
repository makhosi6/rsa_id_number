// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:luhn_algorithm/luhn_algorithm.dart';

class RsaIdUtils {
  static String generateDate({DateTime? maxDate, DateTime? minDate}) {
    if (maxDate?.isAfter(minDate!) == true ||
        maxDate?.isAtSameMomentAs(minDate!) == true) {
      throw "Invalid date range: maxDate should not be after minDate.";
    }
    final fromDate = maxDate ?? DateTime(1920, 1, 1);
    final toDate = minDate ?? DateTime.now();

    DateTime timeBetweenDates =
        toDate.subtract(Duration(days: toDate.difference(fromDate).inDays));

    int daysBetweenDates = toDate.difference(fromDate).inDays;

    int randomNumberOfDays = Random().nextInt(daysBetweenDates);
    DateTime randomDate =
        timeBetweenDates.add(Duration(days: randomNumberOfDays));
    return DateFormat('yyMMdd').format(randomDate);
  }

  static String generateGender(Gender? gender) {
    late int min, max;
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

    int randInt = Random().nextInt(max - min) + min;
    return randInt.toString().padLeft(4, '0');
  }

  static String generateCitizenship([Citizenship? citizenship]) {
    if (citizenship == null) {
      return Random().nextBool() ? '0' : '1';
    } else {
      return citizenship.value;
    }
  }

  static String luhnAppend(String input) {
    List<int> digits =
        input.codeUnits.map((char) => char - '0'.codeUnitAt(0)).toList();
    digits.add(luhnChecksum(digits));
    return utf8
        .decode(digits.map((digit) => digit + '0'.codeUnitAt(0)).toList());
  }

  static int luhnChecksum(List<int> digits) => Luhn.checksum(digits.join(""));

  static int luhnChecksum2(List<int> digits) {
    int sum = 0;
    for (int i = digits.length - 1; i >= 0; i--) {
      int digit = digits[i];
      if ((digits.length - i) % 2 == 0) {
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
