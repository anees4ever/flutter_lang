/// `FlutterLangSingleton` is a singleton class that is used to generate language-specific code.
///
/// apiEndpoint: The endpoint of the API that is used to fetch the language data.
///
/// apiKey: The API key that is used to fetch the language data.
///
/// defaultLanguage: The default language that is used in the absence of the localized language.
///
/// className: The name of the class that is generated which will be used to access the localized data.
///
/// example:
/// @FlutterLangSingleton(
///   apiEndpoint: 'your_api_link',
///   apiKey: 'your_key',
///   defaultLanguage: 'en',
///   className: 'FlutterLanguage',
/// )
/// class FlutterLanguageSingleton {
///
/// }
///
/// usage:  FlutterLanguage.of(context).welcomeText
/// here welcomeText is the key of the localized data
///
///
final class FlutterLangSingleton {
  final int source;
  final String localFile;
  final String apiEndpoint;
  final String apiKey;
  final String defaultLanguage;
  final String className;
  final int stateManagement;

  const FlutterLangSingleton({
    this.source = 1,
    this.localFile = '',
    this.apiEndpoint = '',
    this.apiKey = '',
    this.defaultLanguage = 'en',
    this.className = 'FlutterLanguage',
    this.stateManagement = StateManagement.NONE,
  });

  const FlutterLangSingleton.remote({
    required this.apiEndpoint,
    required this.apiKey,
    this.defaultLanguage = 'en',
    this.className = '',
    this.stateManagement = StateManagement.NONE,
  })  : source = LanguageSource.API,
        localFile = '';

  const FlutterLangSingleton.local({
    required this.localFile,
    this.defaultLanguage = 'en',
    this.className = '',
    this.stateManagement = StateManagement.NONE,
  })  : source = LanguageSource.LOCAL,
        apiEndpoint = '',
        apiKey = '';
}

class LanguageSource {
  /// The language data is fetched from the API.
  static const API = 0;

  /// The language data is fetched from the local JSON file.
  static const LOCAL = 1;
}

class StateManagement {
  //no state management
  static const NONE = 0;

  /// The language state is managed by the provider package.
  static const PROVIDER = 1;

  /// The language state is managed by the getx package.
  static const GETX = 2;
}
