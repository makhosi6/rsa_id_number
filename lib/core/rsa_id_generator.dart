import 'package:rsa_id_number/helpers/rsa_id_utils.dart';

/// Generates random valid South African ID numbers or creates new ones based on specified rules.
class RsaIdGenerator {
  /// Generates a random valid South African ID number.
  ///
  /// - [gender] parameter specifies the gender ('female' or 'male').
  /// - [citizenship] parameter specifies the citizenship ('citizen' or 'resident').
  /// - [maxDate] and [minDate] parameters define the date range for generating the birthdate.
  ///      - maxDate default value is `DateTime(1920)`
  ///      - minDate default value is `DateTime.now()`
  /// Returns a randomly generated valid ID number.
  static String generate({
    Gender? gender,
    Citizenship? citizenship,
    DateTime? maxDate,
    DateTime? minDate,
  }) {
    // Generate a random birthdate within the specified date range.
    final date = RsaIdUtils.generateDate(maxDate: maxDate, minDate: minDate);
    // Generate gender codes.
    final genderCode = RsaIdUtils.generateGender(gender);
    // Generate citizenship codes.
    final citizenshipCode = RsaIdUtils.generateCitizenship(citizenship);
    // Specify the race code (deprecated).
    const raceDeprecated = 8;
    // Calculate the checksum digit and construct the final ID number.
    final luhnNr = RsaIdUtils.luhnAppend(
      "$date$genderCode$citizenshipCode$raceDeprecated",
    );
    return luhnNr;
  }
}
