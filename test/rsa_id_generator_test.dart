import 'package:test/test.dart';
import 'package:rsa_id_number/rsa_id_number.dart';

void main() {
  group('RsaIdGenerator  >>  ', () {
    test('generate should return a valid ID number', () {
      String id = RsaIdGenerator.generate();
      print(id);
      expect(RsaIdValidator.isValid(id), isTrue);
    });
  });
}
