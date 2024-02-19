import 'package:flutter_lang/model/language_model.dart';
import 'package:flutter_lang/model/localization_data_model.dart';

class ClassGenerator {
  final String parentClass;
  final String langClassImport;
  final String defaultLanguage;
  final List<LanguagesModel> availableLanguages;

  Map<String, String> _generatedClasses = {};
  Map<String, String> get generatedClasses => _generatedClasses;

  String get generatedClassesAsString {
    String _classes = '';
    _classes += '/*===========LANGUAGE CLASSES===========*/\n';
    _classes +=
        '// DO NOT EDIT. This is code generated via package:flutter_lang \n';
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
  void generateClasses(List<LocalizationDataModel> languageData) {
    _initializeAllClasses();

    for (var data in languageData) {
      for (var lang in availableLanguages) {
        _insertVariableToClass(data, lang.code);
      }
    }
    for (var lang in _generatedClasses.keys) {
      _generatedClasses[lang] = _generatedClasses[lang]! + "} \n";
    }
  }

  _initializeAllClasses() {
    for (var lang in availableLanguages) {
      String _className = '${parentClass}${lang.code.toUpperCase()}';

      String _classData = '';
      _classData +=
          '/// The translations for ${lang.name} (`${lang.code}`). \n';
      _classData += 'class $_className extends ${parentClass} { \n';
      _classData += '  $_className([super.locale = "${lang.code}"]);\n\n';

      _generatedClasses[lang.code] = _classData;
    }
  }

  _insertVariableToClass(LocalizationDataModel data, String langCode) {
    if (data.key.isEmpty || data.values.isEmpty) {
      return;
    }

    String? value;
    if (data.values.containsKey(langCode) && data.values[langCode]!.isNotEmpty) {
      value = data.values[langCode];
    } else if (langCode != defaultLanguage) {
      value = data.values[defaultLanguage];
    }

    if (value != null) {
      String varStr = '  @override \n';
      varStr += '  String get ${data.key} => "$value"; \n\n';
      if (_generatedClasses.containsKey(langCode)) {
        _generatedClasses[langCode] = _generatedClasses[langCode]! + varStr;
      }
    }
  }
}
