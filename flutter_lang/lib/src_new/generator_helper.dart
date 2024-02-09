import 'package:flutter_lang/model/language_model.dart';
import 'package:flutter_lang/model/localization_data_model.dart';
import 'package:flutter_lang/src_new/annotations.dart';

class HelperGenerator {
  final String parentClass;
  final String langClassImport;
  final String defaultLanguage;
  final List<LanguagesModel> availableLanguages;

  HelperGenerator(
      {required this.parentClass,
      required this.langClassImport,
      required this.defaultLanguage,
      required this.availableLanguages});

  String _classData = '';

  String get generatedData => _classData;

  generate(List<LocalizationDataModel> languageData, int stateManagement) {
    _imports(stateManagement);

    _generateAbstract(languageData, stateManagement);

    _getLocalizationDelegate();
  }

  void _imports(int stateManagement) {
    _classData = '';
    _classData +=
        '// DO NOT EDIT. This is code generated via package:flutter_lang \n';
    _classData += "import 'dart:async'; \n";

    _classData += "import 'package:flutter/foundation.dart'; \n";
    _classData += "import 'package:flutter/widgets.dart'; \n";
    _classData +=
        "import 'package:flutter_localizations/flutter_localizations.dart'; \n";
    _classData += "import 'package:intl/intl.dart' as intl; \n";
    _classData += "import 'package:${langClassImport}'; \n\n";
    switch (stateManagement) {
      case StateManagement.GETX:
        _classData += "import 'package:get/get.dart'; \n\n";
        _classData +=
            "import 'package:${langClassImport.replaceFirst('.lang.g.dart', '.state.g.dart')}'; \n\n";
        break;
      case StateManagement.PROVIDER:
        _classData += "import 'package:provider/provider.dart'; \n\n";
        _classData +=
            "import 'package:${langClassImport.replaceFirst('.lang.g.dart', '.state.g.dart')}'; \n\n";
        break;
    }
  }

  void _generateAbstract(
      List<LocalizationDataModel> languageData, int stateManagement) {
    _classData += "abstract class $parentClass { \n";
    _classData +=
        "  $parentClass(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString()); \n\n";
    _classData += "  final String localeName; \n\n";

    _classData += "  static $parentClass of(BuildContext context) { \n";
    _classData +=
        "    return Localizations.of<$parentClass>(context, $parentClass) ?? ${parentClass}${defaultLanguage.toUpperCase()}(); \n";
    _classData += "  } \n\n";

    _classData +=
        "  static const LocalizationsDelegate<$parentClass> delegate = _${parentClass}Delegate(); \n\n";

    _classData +=
        "  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[ \n";
    _classData += "    delegate, \n";
    _classData += "    GlobalMaterialLocalizations.delegate, \n";
    _classData += "    GlobalCupertinoLocalizations.delegate, \n";
    _classData += "    GlobalWidgetsLocalizations.delegate, \n";
    _classData += "  ]; \n\n";

    _classData += "  static const List<Locale> supportedLocales = <Locale>[ \n";
    for (var lang in availableLanguages) {
      _classData += "    Locale('${lang.code}'), \n";
    }
    _classData += "  ]; \n\n";

    _classData +=
        "  static const Map<String, String> supportedLanguages = { \n";
    for (var lang in availableLanguages) {
      _classData += "'${lang.code}': '${lang.name}', \n";
    }
    _classData += "  }; \n\n";

    switch (stateManagement) {
      case StateManagement.GETX:
        _classData +=
            "static void setCurrentLanguage(String languageCode) { \n";
        _classData +=
            "  ${parentClass}GetXController controller= Get.find(); \n";
        _classData += "  controller.changeLanguage(languageCode); \n";
        _classData += "} \n\n";

        _classData += "static Locale getCurrentLanguage() { \n";
        _classData +=
            "  ${parentClass}GetXController controller= Get.find(); \n";
        _classData += "  return controller.getCurrentLocale; \n";
        _classData += "} \n\n";

        _classData +=
            "static FlutterLanguage get current => Get.context == null \n";
        _classData += "    ? FlutterLanguageEN() \n";
        _classData += "    : FlutterLanguage.of(Get.context!); \n";
        _classData += "\n\n";

        break;
      case StateManagement.PROVIDER:
        _classData +=
            "static void setCurrentLanguage(BuildContext context, String languageCode) { \n";
        _classData +=
            "  final provider = Provider.of<${parentClass}ChangeProvider>(context, listen: false); \n";
        _classData += "  provider.changeLanguage(languageCode); \n";
        _classData += "} \n\n";

        _classData +=
            "static Locale getCurrentLanguage(BuildContext context) { \n";
        _classData +=
            "  final provider = Provider.of<${parentClass}ChangeProvider>(context, listen: false); \n";
        _classData += "  return provider.getCurrentLocale; \n";
        _classData += "} \n\n";
        break;
    }
    _classData += "\n";

    for (var data in languageData) {
      if (data.description.isNotEmpty) {
        _classData += "  /// ${data.description} \n";
        _classData += "  /// \n";
      }
      if (data.values.containsKey(defaultLanguage)) {
        _classData +=
            "  /// [$defaultLanguage]: **'${data.values[defaultLanguage]}'** \n";
      }
      _classData += "  String get ${data.key}; \n";
    }

    _classData += "} \n\n";

    _classData += "extension ${parentClass}StringExtension on String {\n";
    _classData += "  String withParam(dynamic param) {\n";
    _classData += "    return withParams([param]);\n";
    _classData += "  }\n";
    _classData += "\n";
    _classData += "  String withParams(List<dynamic> params) {\n";
    _classData += "    //return the string itself if no params are passed\n";
    _classData += "    if (params.isEmpty) return this;\n";
    _classData +=
        "    //replace the placeholder %s with the params in the order they are passed\n";
    _classData += "    String result = this;\n";
    _classData += "    for (int i = 0; i < params.length; i++) {\n";
    _classData +=
        "      result = result.replaceFirst('%s', params[i].toString());\n";
    _classData += "    }\n";
    _classData += "    return result;\n";
    _classData += "  }\n";
    _classData += "}\n\n";
  }

  void _getLocalizationDelegate() {
    _classData +=
        "class _${parentClass}Delegate extends LocalizationsDelegate<$parentClass> { \n";
    _classData += "  const _${parentClass}Delegate(); \n\n";

    _classData += "  @override \n";
    _classData += "  Future<$parentClass> load(Locale locale) { \n";
    _classData +=
        "    return SynchronousFuture<$parentClass>(read$parentClass(locale)); \n";
    _classData += "  } \n\n";

    _classData += "  @override \n";
    _classData += "  bool isSupported(Locale locale) => <String>[ \n";
    for (var lang in availableLanguages) {
      _classData += "    '${lang.code}', \n";
    }
    _classData += "  ].contains(locale.languageCode); \n\n";

    _classData += "  @override \n";
    _classData +=
        "  bool shouldReload(_${parentClass}Delegate old) => false; \n";

    _classData += "} \n";

    _classData += "$parentClass read$parentClass(Locale locale) { \n";
    _classData += "  switch (locale.languageCode) { \n";
    for (var lang in availableLanguages) {
      _classData +=
          "    case '${lang.code}': return ${parentClass}${lang.code.toUpperCase()}(); \n";
    }
    _classData +=
        "    default: return ${parentClass}${defaultLanguage.toUpperCase()}(); \n";
    _classData += "  } \n";

    _classData += "} \n";
  }
}
