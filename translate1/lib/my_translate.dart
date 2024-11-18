import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'hello': 'Hello',
          'welcome': 'Welcome',
          'language': 'Language',
        },
        'km': {
          'hello': 'សួស្តី',
          'welcome': 'សូមស្វាគមន៍',
          'language': 'ភាសា',
        },
      };
}
