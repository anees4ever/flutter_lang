class HelperGenerator {
  final String parentClass;
  final String langClassImport;
  final String defaultLanguage;
  final Map<String, String> availableLanguages;

  HelperGenerator(
      {required this.parentClass,
      required this.langClassImport,
      required this.defaultLanguage,
      required this.availableLanguages});

  String _classData = '';

  String get generatedData => _classData;

  generate(Map<String, Map<String, String>> languageData) {
    _imports();

    _generateAbstract(languageData);

    _getLocalizationDelegate();
  }

  void _imports() {
    _classData = '';
    _classData +=
        '/// DO NOT EDIT. This is code generated via package:flutter_lang \n';
    _classData += "import 'dart:async'; \n";

    _classData += "import 'package:flutter/foundation.dart'; \n";
    _classData += "import 'package:flutter/widgets.dart'; \n";
    _classData +=
        "import 'package:flutter_localizations/flutter_localizations.dart'; \n";
    _classData += "import 'package:intl/intl.dart' as intl; \n";
    _classData += "import 'package:${langClassImport}'; \n\n";
  }

  void _generateAbstract(Map<String, Map<String, String>> languageData) {
    _classData += "abstract class $parentClass { \n";
    _classData +=
        "  $parentClass(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString()); \n\n";
    _classData += "  final String localeName; \n\n";

    _classData += "  static $parentClass? of(BuildContext context) { \n";
    _classData +=
        "    return Localizations.of<$parentClass>(context, $parentClass); \n";
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
    for (var lang in availableLanguages.keys) {
      _classData += "    Locale('$lang'), \n";
    }
    _classData += "  ]; \n\n";

    for (var key in languageData.keys) {
      Map<String, String>? _data = languageData[key];
      if (_data == null) continue;
      if (_data.containsKey('description') &&
          _data['description']!.isNotEmpty) {
        _classData +=
            "  /// This is a sample text to show as a welcome text \n";
        _classData += "  /// \n";
      }
      if (_data.containsKey(defaultLanguage)) {
        _classData +=
            "  /// In $defaultLanguage, this message translates to: \n";
        _classData += "  /// **'${_data[defaultLanguage]}'** \n";
      }
      _classData += "  String get $key; \n";
    }

    _classData += "} \n";
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
    for (var lang in availableLanguages.keys) {
      _classData += "    '$lang', \n";
    }
    _classData += "  ].contains(locale.languageCode); \n\n";

    _classData += "  @override \n";
    _classData +=
        "  bool shouldReload(_${parentClass}Delegate old) => false; \n";

    _classData += "} \n";

    _classData += "$parentClass read$parentClass(Locale locale) { \n";
    _classData += "  switch (locale.languageCode) { \n";
    for (var lang in availableLanguages.keys) {
      _classData +=
          "    case '$lang': return ${parentClass}${lang.toUpperCase()}(); \n";
    }
    _classData +=
        "    default: return ${parentClass}${defaultLanguage.toUpperCase()}(); \n";
    _classData += "  } \n";

    _classData += "throw FlutterError( \n";
    _classData +=
        "    'Locale \${locale.languageCode} is not supported by this app'); \n";

    _classData += "} \n";
  }
}
