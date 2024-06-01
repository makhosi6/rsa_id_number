import 'package:rsa_id_number/rsa_id_number.dart';

/// Parse South African ID numbers into an object with properties, i.e, date of birth, sex, race, etc.
class RsaIdParser {
  
  final String idNumber;
  /// DateTime object representing the date of birth, extracted from the first 6 characters of the ID number
  late final DateTime dateOfBirth;
  // gender or sex, extracted from character 7 - 11 of the ID number
  late final Gender sex;

  /// an enum to indicate if you were born in South africa or not
  late final Citizenship citizenship;

  /// returns 8 always, since race is not longer used
  late final int race;

  /// this property user [RsaIdValidator] class to validate an id number
  late final bool isValid;

  /// [idNumber] is the 13-digit South African ID number.
  /// Throws an exception if the ID number is not valid.
  RsaIdParser.parse(this.idNumber) {
    if (idNumber.length != 13) {
      throw 'Invalid ID number length';
    }
    dateOfBirth = _parseDateOfBirth(idNumber.substring(0, 6));
    sex = _parseGender(idNumber.substring(6, 10));
    citizenship = _parseCitizenship(idNumber.substring(10, 11));
    race = int.parse(idNumber.substring(11, 12));
    isValid = _validateIdNumber(idNumber);
  }

  /// Parses the date of birth from the ID number
  ///
  /// [dateOfBirthStr] is a string in the format YYMMDD.
  /// Returns the date of birth as a DateTime object.
  DateTime _parseDateOfBirth(String dateOfBirthStr) {
    final now = DateTime.now();
    final int year = int.parse(dateOfBirthStr.substring(0, 2));
    final int month = int.parse(dateOfBirthStr.substring(2, 4));
    final int day = int.parse(dateOfBirthStr.substring(4));

    /// If [year] is greater than current year we assume it's the last century(1900) otherwise use current century(2000)
    /// NOTE: [year] is a two digit number at this point
    final century =
        (int.parse('${now.year}'.substring(2, 4)) < year) ? 1900 : 2000;
    final fullYear = century + year;
    return DateTime(fullYear, month, day);
  }

  /// Parses the gender from the ID number
  ///
  /// [genderStr] is a string representing the gender code.
  /// Returns the gender as a Gender enum.
  Gender _parseGender(String genderStr) {
    final int genderCode = int.parse(genderStr);
    return genderCode < 5000 ? Gender.FEMALE : Gender.MALE;
  }

  /// Parses the citizenship from the ID number
  ///
  /// [citizenshipStr] is a string representing the citizenship code.
  /// Returns the citizenship as a Citizenship enum.
  Citizenship _parseCitizenship(String citizenshipStr) {
    final int citizenshipCode = int.parse(citizenshipStr);
    return citizenshipCode == 0
        ? Citizenship.CITIZEN_BORN
        : Citizenship.CITIZEN_NOT_BORN;
  }

  /// Validates the ID number using the Luhn algorithm
  ///
  /// [idNumber] is the full 13-digit ID number.
  /// Returns `true` if the ID number is valid, otherwise `false`.
  bool _validateIdNumber(String idNumber) {
    return RsaIdValidator.isValid(idNumber);
  }
}
