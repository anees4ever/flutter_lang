// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// LanguageGenerator
// **************************************************************************

// DO NOT EDIT. This is code generated via package:flutter_lang
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:example/localization/flutter_lang.lang.g.dart';

import 'package:provider/provider.dart';

import 'package:example/localization/flutter_lang.state.g.dart';

abstract class TranslationsHelper {
  TranslationsHelper(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static TranslationsHelper of(BuildContext context) {
    return Localizations.of<TranslationsHelper>(context, TranslationsHelper) ??
        TranslationsHelperEN();
  }

  static const LocalizationsDelegate<TranslationsHelper> delegate =
      _TranslationsHelperDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('ml'),
    Locale('kn'),
    Locale('ta'),
  ];

  static const Map<String, String> supportedLanguages = {
    'en': 'English',
    'hi': 'Hindi',
    'ml': 'Malayalam',
    'kn': 'Kannada',
    'ta': 'Tamil',
  };

  static void setCurrentLanguage(BuildContext context, String languageCode) {
    final provider =
        Provider.of<TranslationsHelperChangeProvider>(context, listen: false);
    provider.changeLanguage(languageCode);
  }

  static Locale getCurrentLanguage(BuildContext context) {
    final provider =
        Provider.of<TranslationsHelperChangeProvider>(context, listen: false);
    return provider.getCurrentLocale;
  }

  /// A title for the application
  ///
  /// [en]: **'Flutter Lang Demo'**
  String get title;

  /// A label on the button to change language
  ///
  /// [en]: **'Change Language'**
  String get changeLanguage;

  /// A label to show the current language
  ///
  /// [en]: **'Your language is set to %s'**
  String get yourLanguageIsSetTo;

  /// A sample text to show as a welcome text
  ///
  /// [en]: **'Hello World'**
  String get helloWorld;

  /// A label on the Save button
  ///
  /// [en]: **'Save'**
  String get save;

  /// A label on the Cancel button
  ///
  /// [en]: **'Cancel'**
  String get cancel;
}

extension TranslationsHelperStringExtension on String {
  String withParam(dynamic param) {
    return withParams([param]);
  }

  String withParams(List<dynamic> params) {
    //return the string itself if no params are passed
    if (params.isEmpty) return this;
    //replace the placeholder %s with the params in the order they are passed
    String result = this;
    for (int i = 0; i < params.length; i++) {
      result = result.replaceFirst('%s', params[i].toString());
    }
    return result;
  }
}

class _TranslationsHelperDelegate
    extends LocalizationsDelegate<TranslationsHelper> {
  const _TranslationsHelperDelegate();

  @override
  Future<TranslationsHelper> load(Locale locale) {
    return SynchronousFuture<TranslationsHelper>(
        readTranslationsHelper(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'hi',
        'ml',
        'kn',
        'ta',
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_TranslationsHelperDelegate old) => false;
}

TranslationsHelper readTranslationsHelper(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return TranslationsHelperEN();
    case 'hi':
      return TranslationsHelperHI();
    case 'ml':
      return TranslationsHelperML();
    case 'kn':
      return TranslationsHelperKN();
    case 'ta':
      return TranslationsHelperTA();
    default:
      return TranslationsHelperEN();
  }
}
