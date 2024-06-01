import 'package:rsa_id_number/rsa_id_number.dart';
import 'package:test/test.dart';

void main() {
  group('RsaIdParser', () {
    test('should parse a valid ID number correctly', () {
      const String idNumber = '7309179271083';

      final RsaIdParser parser = RsaIdParser.parse(idNumber);
      

      expect(parser.dateOfBirth, DateTime.parse('19730917'));
      expect(parser.sex, Gender.MALE);
      expect(parser.citizenship, Citizenship.CITIZEN_BORN);
      expect(parser.isValid, true);
    });

    test('should throw an exception for an invalid ID number length', () {
    const invalidIdNumber = '7309179';

      expect(() => RsaIdParser.parse(invalidIdNumber), throwsA(isA<String>()));
    });

    test('should return false for an invalid ID number', () {
      const invalidIdNumber = '7309179271088';  
      final RsaIdParser parser = RsaIdParser.parse(invalidIdNumber);

      expect(parser.isValid, false);
    });
  });


}
