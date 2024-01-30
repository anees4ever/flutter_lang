import 'package:flutter_lang/generators.dart';

@FlutterLangSingleton.local(
  //source: LanguageSource.LOCAL,
  //apiEndpoint: 'your_api_link',
  //apiKey: 'your_key',
  localFile: './lib/localization/languages_data.json',
  defaultLanguage: 'en',
  stateManagement: StateManagement.PROVIDER,
)
class FlutterLanguageSingleton {}
