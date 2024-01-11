# rsa_id_number

A Dart package for validating and generating South African ID numbers.

## Features

- **Validation**: Validate South African ID numbers based on the specified [format](https://en.wikipedia.org/wiki/South_African_identity_card).
- **Generation**: Generate random South African ID numbers.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  rsa_id_number:
```

Then run:

```bash
$ pub get
```

or

```bash
$ flutter pub get
```

## Usage

### Validation

```dart
import 'package:rsa_id_number/rsa_id_validator.dart';

void main() {
  String idToValidate = '9202204720082';
  bool isValid = RsaIdValidator.isValid(idToValidate);
  print('Is valid ID: $isValid');
}
```

### Generation

```dart
import 'package:rsa_id_number/rsa_id_generator.dart';

void main() {
  /// generate a random/valid SA id number
  final rsaIdNumber = RsaIdGenerator.generate();
  log('Generated ID: $rsaIdNumber');

  /// generate with options
  final rsaIdNumber2 = RsaIdGenerator.generate(
    gender: Gender.FEMALE,
    citizenship: Citizenship.CITIZEN_BORN,
    maxDate: DateTime(1969),
    minDate: DateTime.now(),
  );
  log('Generated ID: $rsaIdNumber2');
}
```

## Contributing

Feel free to [contribute](./CONTRIBUTE.md) to this project by submitting issues and pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
