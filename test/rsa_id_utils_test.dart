import 'package:test/test.dart';
import 'package:rsa_id_number/rsa_id_number.dart';

void main() {
  group('RsaIdUtils >> ', () {
    test('generateDate should return a valid date string', () {
      String date = RsaIdUtils.generateDate();
      int year = int.parse(date.substring(0, 2));
      int month = int.parse(date.substring(2, 4));
      int day = int.parse(date.substring(4, 6));

      expect(
          DateTime.tryParse(DateTime(year, month, day).toString()), isNotNull);

      expect(date.length, equals(6));
    });
    test(
        'generateDate should return a valid date string within specified range',
        () {
      DateTime maxDate = DateTime(1920, 1, 1);
      DateTime minDate = DateTime.now();

      String date = RsaIdUtils.generateDate(minDate: minDate, maxDate: maxDate);
      int year = int.parse(date.substring(0, 2));

      int month = int.parse(date.substring(2, 4));
      int day = int.parse(date.substring(4, 6));

      /// if year is 2000-based
      DateTime generatedDate = DateTime(2000 + year, month, day);

      /// if year is 1900-based
      DateTime generatedDate2 = DateTime(1900 + year, month, day);

      expect(
          (generatedDate.isBefore(minDate) ||
                  generatedDate.isAtSameMomentAs(minDate)) ||
              (generatedDate2.isBefore(minDate) ||
                  generatedDate2.isAtSameMomentAs(minDate)),
          isTrue,
          reason: 'Date should not be after minDate');
      expect(
          (generatedDate.isAfter(maxDate) ||
                  generatedDate.isAtSameMomentAs(maxDate)) ||
              (generatedDate2.isAfter(maxDate) ||
                  generatedDate2.isAtSameMomentAs(maxDate)),
          isTrue,
          reason: 'Date should not be before maxDate');

      expect(date.length, equals(6));
    });

    test('generateGender should return a valid gender code', () {
      String gender = RsaIdUtils.generateGender(Gender.FEMALE);
      String gender1 = RsaIdUtils.generateGender(Gender.MALE);
      // a number between 5000 - 1000
      final female = int.parse(gender);
      expect((female >= 0 && female <= 5000), isTrue);
      // a number between 0 - 5000
      final male = int.parse(gender1);
      expect((male >= 5000 && male <= 10000), isTrue);
    });

    test('generateCitizenship should return a valid citizenship code', () {
      String citizenship = RsaIdUtils.generateCitizenship();
      String citizenship1 =
          RsaIdUtils.generateCitizenship(Citizenship.CITIZEN_BORN);
      expect(citizenship, anyOf('0', '1'));
      expect(citizenship1, Citizenship.CITIZEN_BORN.value);
    });

    test('luhnAppend should return a valid ID number with checksum', () {
      // original ID number = 5110275215186
      String input = '511027521518';
      String idWithChecksum = RsaIdUtils.luhnAppend(input);

      expect(RsaIdValidator.isValid(idWithChecksum), isTrue);
    });
    test('luhnAppend should return a valid ID number with checksum 2', () {
      // original ID number = 5110275215186
      String input = '511027521518';
      String idWithChecksum = RsaIdUtils.luhnAppend(input);

      expect(RsaIdValidator.isValid(idWithChecksum), isTrue);
    });
  });
}
