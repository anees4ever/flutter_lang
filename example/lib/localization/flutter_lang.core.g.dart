// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// LanguageGenerator
// **************************************************************************

/// DO NOT EDIT. This is code generated via package:flutter_lang
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:example/localization/flutter_lang.lang.g.dart';

import 'package:provider/provider.dart';

import 'package:example/localization/flutter_lang.state.g.dart';

abstract class FlutterLanguage {
  FlutterLanguage(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FlutterLanguage? of(BuildContext context) {
    return Localizations.of<FlutterLanguage>(context, FlutterLanguage);
  }

  static const LocalizationsDelegate<FlutterLanguage> delegate =
      _FlutterLanguageDelegate();

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

void setCurrentFlutterLanguage(BuildContext context, String languageCode) {
  final provider =
      Provider.of<FlutterLanguageChangeProvider>(context, listen: false);
  provider.changeLanguage(languageCode);
}

Locale getCurrentFlutterLanguage(BuildContext context) {
  final provider =
      Provider.of<FlutterLanguageChangeProvider>(context, listen: false);
  return provider.getCurrentLocale;
}

class _FlutterLanguageDelegate extends LocalizationsDelegate<FlutterLanguage> {
  const _FlutterLanguageDelegate();

  @override
  Future<FlutterLanguage> load(Locale locale) {
    return SynchronousFuture<FlutterLanguage>(readFlutterLanguage(locale));
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
  bool shouldReload(_FlutterLanguageDelegate old) => false;
}

FlutterLanguage readFlutterLanguage(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return FlutterLanguageEN();
    case 'hi':
      return FlutterLanguageHI();
    case 'ml':
      return FlutterLanguageML();
    case 'kn':
      return FlutterLanguageKN();
    case 'ta':
      return FlutterLanguageTA();
    default:
      return FlutterLanguageEN();
  }
}
