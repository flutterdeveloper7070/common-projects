import 'package:commonsprojects/common_imports.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': enEN,
    };
  }

  static final Map<String, String> enEN = {
    'somethingWentWrong': 'Something went wrong',
  };
}
