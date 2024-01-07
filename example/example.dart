import 'dart:developer';

import 'package:rsa_id_number/rsa_id_number.dart';

void main() {
  /// Validate
  String idToValidate = '9202204720082';
  bool isValid = RsaIdValidator.isValid(idToValidate);
  log('Is valid ID: $isValid');

  /// Generation a random/valid SA id number
  String rsaIdNumber = RsaIdGenerator.generate();
  log('Generated ID: $rsaIdNumber');

  /// generate with options
  String rsaIdNumber2 = RsaIdGenerator.generate(
    gender: Gender.FEMALE,
    citizenship: Citizenship.CITIZEN_BORN,
    maxDate: DateTime(1969, 1, 1),
    minDate: DateTime.now(),
  );
  log('Generated with opts: $rsaIdNumber2');
}
