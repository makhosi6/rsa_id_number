import 'package:rsa_id_number/helpers/rsa_id_utils.dart';

class RsaIdGenerator {
  static String generate({
    Gender? gender,
    Citizenship? citizenship,
    DateTime? maxDate,
    DateTime? minDate,
  }) {
    final date = RsaIdUtils.generateDate(maxDate: maxDate, minDate: minDate);
    final genderCode = RsaIdUtils.generateGender(gender);
    final citizenshipCode = RsaIdUtils.generateCitizenship(citizenship);
    const raceDeprecated = 8;

    final luhnNr = RsaIdUtils.luhnAppend(
      "$date$genderCode$citizenshipCode$raceDeprecated",
    );
    return luhnNr;
  }
}
