import 'package:flutter_lang/generators.dart';

@FlutterLangSingleton.local(
  localFile: './assets/languages_data.json',
  defaultLanguage: 'en',
  stateManagement: StateManagement.PROVIDER,
)
class Translations {}
