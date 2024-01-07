import 'package:test/test.dart';
import 'package:rsa_id_number/rsa_id_number.dart';

void main() {
  group('RsaIdValidator >> ', () {
    test('isValid should return true for a valid ID number', () {
      expect(RsaIdValidator.isValid('7309179271083'), isTrue);
    });

    test('isValid should return false for an invalid ID number', () {
      expect(RsaIdValidator.isValid('1234567890123'), isFalse);
    });

    test('isValidDate should return true for a valid date', () {
      expect(RsaIdValidator.isValidDate('920123'), isTrue);
    });

    test('isValidDate should return false for an invalid date', () {
      expect(RsaIdValidator.isValidDate('000000'), isFalse);
    });

    test(
        'isValidSequentialNumber should return true for a valid sequential number',
        () {
      expect(RsaIdValidator.isValidSequentialNumber('1234'), isTrue);
    });

    test(
        'isValidSequentialNumber should return false for an invalid sequential number',
        () {
      expect(RsaIdValidator.isValidSequentialNumber('10000'), isFalse);
    });

    test('isValidCitizenship should return true for a valid citizenship code',
        () {
      expect(RsaIdValidator.isValidCitizenship('0'), isTrue);
    });

    test(
        'isValidCitizenship should return false for an invalid citizenship code',
        () {
      expect(RsaIdValidator.isValidCitizenship('2'), isFalse);
    });

    test(
        'isValidChecksum should return true for a valid ID number with checksum',
        () {
      expect(RsaIdValidator.isValidChecksum('5712207016085'), isTrue);
    });

    test(
        'isValidChecksum should return false for an invalid ID number with incorrect checksum',
        () {
      expect(RsaIdValidator.isValidChecksum('8801231234120'), isFalse);
    });
  });
}
