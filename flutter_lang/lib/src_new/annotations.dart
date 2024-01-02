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
  final String apiEndpoint;
  final String apiKey;
  final String defaultLanguage;
  final String className;
  final bool generateProvider;
  const FlutterLangSingleton({
    required this.apiEndpoint,
    required this.apiKey,
    this.defaultLanguage = 'en',
    this.className = 'FlutterLanguage',
    this.generateProvider = false,
  });
}
