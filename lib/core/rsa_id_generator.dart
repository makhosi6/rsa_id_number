import '../helpers/rsa_id_utils.dart';

class RsaIdGenerator {
  static String generate({
    Gender? gender,
    Citizenship? citizenship,
    DateTime? maxDate,
    DateTime? minDate,
  }) {
    String date = RsaIdUtils.generateDate(maxDate: maxDate, minDate: minDate);
    String genderCode = RsaIdUtils.generateGender(gender);
    String citizenshipCode = RsaIdUtils.generateCitizenship(citizenship);
    int raceDeprecated = 8;

    String luhnNr = RsaIdUtils.luhnAppend(
        "$date$genderCode$citizenshipCode$raceDeprecated");
    return luhnNr;
  }
}
