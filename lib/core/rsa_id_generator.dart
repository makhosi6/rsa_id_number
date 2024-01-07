import '../helpers/rsa_id_utils.dart';

class RsaIdGenerator {
  // TODO : add year min/max
  static String generate({Gender? gender, Citizenship? citizenship}) {
    String date = RsaIdUtils.generateDate();
    String genderCode = RsaIdUtils.generateGender(gender);
    String citizenshipCode = RsaIdUtils.generateCitizenship(citizenship);
    int raceDeprecated = 8;

    String luhnNr = RsaIdUtils.luhnAppend(
        "$date$genderCode$citizenshipCode$raceDeprecated");
    return luhnNr;
  }
}
