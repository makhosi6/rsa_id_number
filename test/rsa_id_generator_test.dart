import 'package:test/test.dart';
import 'package:rsa_id_number/rsa_id_number.dart';

void main() {
  group('RsaIdGenerator  >>  ', () {
    test('generate should return a valid ID number', () {
      String id = RsaIdGenerator.generate();
      expect(RsaIdValidator.isValid(id), isTrue);
    });

    test('generate should return a valid ID number (with extra params)', () {
      String id = RsaIdGenerator.generate(
        gender: Gender.MALE,
        citizenship: Citizenship.CITIZEN_BORN,
        maxDate: DateTime(1969, 1, 1),
        minDate: DateTime.now(),
      );
      expect(RsaIdValidator.isValid(id), isTrue);
    });
  });
}
