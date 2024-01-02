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
import 'package:example/flutter_lang.lang.g.dart';

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

  /// This is a sample text to show as a welcome text
  ///
  /// In en, this message translates to:
  /// **'Flutter Lang Demo'**
  String get title;

  /// This is a sample text to show as a welcome text
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// This is a sample text to show as a welcome text
  ///
  /// In en, this message translates to:
  /// **'Your language is set to %s'**
  String get yourLanguageIsSetTo;

  /// This is a sample text to show as a welcome text
  ///
  /// In en, this message translates to:
  /// **'Hello World'**
  String get helloWorld;

  /// This is a sample text to show as a welcome text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// This is a sample text to show as a welcome text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;
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
  throw FlutterError(
      'Locale ${locale.languageCode} is not supported by this app');
}
