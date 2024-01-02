class ClassGenerator {
  final String parentClass;
  final String langClassImport;
  final String defaultLanguage;
  final Map<String, String> availableLanguages;

  Map<String, String> _generatedClasses = {};
  Map<String, String> get generatedClasses => _generatedClasses;

  String get generatedClassesAsString {
    String _classes = '';
    _classes += '/*===========LANGUAGE CLASSES===========*/\n';
    _classes +=
        '/// DO NOT EDIT. This is code generated via package:flutter_lang \n';
    _classes += "import 'package:${langClassImport}'; \n\n";

    for (var key in _generatedClasses.keys) {
      _classes += _generatedClasses[key]! + '\n\n';
    }
    return _classes;
  }

  ClassGenerator(
      {required this.parentClass,
      required this.langClassImport,
      required this.defaultLanguage,
      required this.availableLanguages});

  //generate class for each available language based on the demo data and add fields to the generated class
  void generateClasses(Map<String, Map<String, String>> languageData) {
    _initializeAllClasses();

    for (var key in languageData.keys) {
      for (var lang in availableLanguages.keys) {
        _insertVariableToClass(languageData, key, lang);
      }
    }
    for (var lang in _generatedClasses.keys) {
      _generatedClasses[lang] = _generatedClasses[lang]! + "}";
    }
  }

  _initializeAllClasses() {
    for (var lang in availableLanguages.keys) {
      String _className = '${parentClass}${lang.toUpperCase()}';

      String _classData = '';
      _classData +=
          '/// The translations for ${availableLanguages[lang]} (`$lang`). \n';
      _classData += 'final class $_className extends ${parentClass} { \n';
      _classData +=
          '$_className([String locale = "$lang"]) : super(locale);\n\n';

      _generatedClasses[lang] = _classData;
    }
  }

  _insertVariableToClass(
      Map<String, Map<String, String>> languageData, String key, String lang) {
    if (languageData[key] == null) {
      return;
    }

    String? value;
    if (languageData[key]!.containsKey(lang)) {
      value = languageData[key]![lang];
    } else if (lang != defaultLanguage) {
      value = languageData[key]![defaultLanguage];
    }

    if (value != null) {
      String varStr = '@override \n';
      varStr += 'String get $key => "$value"; \n\n';
      if (_generatedClasses.containsKey(lang)) {
        _generatedClasses[lang] = _generatedClasses[lang]! + varStr;
      }
    }
  }
}
