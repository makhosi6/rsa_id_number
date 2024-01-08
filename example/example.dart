import 'dart:developer';

import 'package:rsa_id_number/rsa_id_number.dart';

void main() {
  /// Validate
  const idToValidate = '9202204720082';
  final isValid = RsaIdValidator.isValid(idToValidate);
  log('Is valid ID: $isValid');

  /// Generation a random/valid SA id number
  final rsaIdNumber = RsaIdGenerator.generate();
  log('Generated ID: $rsaIdNumber');

  /// generate with options
  final rsaIdNumber2 = RsaIdGenerator.generate(
    gender: Gender.FEMALE,
    citizenship: Citizenship.CITIZEN_BORN,
    maxDate: DateTime(1969),
    minDate: DateTime.now(),
  );
  log('Generated with opts: $rsaIdNumber2');
}
