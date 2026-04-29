import 'package:rsa_id_number/helpers/luhn.dart';
import 'package:test/test.dart';

void main() {
  group('LuhnUtils >> ', () {
    const validIds = [
      '5301014800087',
      '5307225800089',
      '9701315800080',
      '5312305800082',
      '9401315800087',
      '0502210876186',
      '0502213661189',
      '0102219308081',
      '0102216565188',
      '1902218212187',
      '2305082146086',
      '2305084523084',
    ];
    const invalidIds = [
      '19022188430810',
    ];

    test('validate should return true for provided valid IDs', () {
      for (final id in validIds) {
        expect(LuhnUtils.validate(id), isTrue, reason: 'Expected valid: $id');
      }
    });

    test('validate should return false for provided invalid IDs', () {
      for (final id in invalidIds) {
        expect(LuhnUtils.validate(id), isFalse, reason: 'Expected invalid: $id');
      }
    });

    test('checksum should match check digits from provided IDs', () {
      for (final id in validIds) {
        final expectedCheckDigit = int.parse(id.substring(id.length - 1));
        
        final body = id.substring(0, id.length - 1);
        final digits = body.codeUnits.map((char) => char - 48).toList();
        expect(
          LuhnUtils.checksum(digits),
          equals(expectedCheckDigit),
          reason: 'Unexpected check digit for: $id',
        );
      }
    });
  });
}
