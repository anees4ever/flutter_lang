//mock api for ApiAbstract class
import 'package:dio/dio.dart';
import 'package:flutter_lang/api/api_abstract.dart';
import 'package:flutter_lang/model/language_model.dart';
import 'package:flutter_lang/model/localization_data_model.dart';

class MockApi extends ApiAbstract {
  @override
  void setParams(String apiKey, String apiEndpoint) {}

  @override
  Future<List<LanguagesModel>> getLanguages() async {
    Response response = Response(
      requestOptions: RequestOptions(path: ''),
      data: {
        "data": [
          {
            "id": 1,
            "name": "English",
            "code": "en",
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          },
          {
            "id": 2,
            "name": "Hindi",
            "code": "hi",
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          },
          {
            "id": 3,
            "name": "Malayalam",
            "code": "ml",
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          },
          {
            "id": 4,
            "name": "Kannada",
            "code": "kn",
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          },
          {
            "id": 5,
            "name": "Tamil",
            "code": "ta",
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          }
        ]
      },
      statusCode: 200,
    );

    return LanguagesModel.fromJsonList(response.data['data']);
  }

  @override
  Future<List<LocalizationDataModel>> getLanguageData() async {
    Response response = Response(
      requestOptions: RequestOptions(path: ''),
      data: {
        "data": [
          {
            "id": 1,
            "key": "title",
            "values": {
              'en': 'Flutter Lang Demo',
              'hi': 'फ्लटर भाषा डेमो',
              'ml': 'ഫ്ലട്ടർ ഭാഷ ഡെമോ',
              'kn': 'ಫ್ಲಟರ್ ಭಾಷಾ ಡೆಮೊ',
              'ta': 'ஃப்ளட்டர் மொழி டெமோ',
            },
            'description': 'A title for the application',
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          },
          {
            "id": 2,
            "key": "changeLanguage",
            'values': {
              'en': 'Change Language',
              'hi': 'भाषा बदलो',
              'ml': 'ഭാഷ മാറ്റുക',
              'kn': 'ಭಾಷೆ ಬದಲಾಯಿಸಿ',
              'ta': 'மொழியை மாற்று',
            },
            'description': 'A label on the button to change language',
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          },
          {
            "id": 3,
            "key": "yourLanguageIsSetTo",
            'values': {
              'en': 'Your language is set to %s',
              'hi': 'आपकी भाषा सेट है %s',
              'ml': 'നിങ്ങളുടെ ഭാഷ സജ്ജീകരിച്ചിരിക്കുന്നു %s',
              'kn': 'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಸೆಟ್ ಮಾಡಲಾಗಿದೆ %s',
              'ta': 'உங்கள் மொழியை அமைக்கலாம் %s',
            },
            'description': 'A label to show the current language',
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          },
          {
            "id": 4,
            "key": "helloWorld",
            'values': {
              'en': 'Hello World',
              'hi': 'नमस्ते दुनिया',
              'ml': 'ഹലോ വേൾഡ്',
              'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
              'ta': 'ஹலோ வேர்ல்ட்',
            },
            'description': 'A sample text to show as a welcome text',
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          },
          {
            "id": 5,
            "key": "save",
            'values': {
              'en': 'Save',
              'hi': 'बचाना',
              'ml': 'സേവ്',
              'kn': 'ಉಳಿಸಿ',
              'ta': 'சேமி',
            },
            'description': 'A label on the Save button',
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          },
          {
            "id": 6,
            "key": "cancel",
            'values': {
              'en': 'Cancel',
              'hi': 'रद्द करना',
              'ml': 'റദ്ദാക്കുക',
              'kn': 'ರದ್ದುಗೊಳಿಸಿ',
              'ta': 'ரத்து',
            },
            'description': 'A label on the Cancel button',
            "created_at": "2021-09-30T10:00:00.000000Z",
            "updated_at": "2021-09-30T10:00:00.000000Z"
          }
        ],
      },
      statusCode: 200,
    );

    return LocalizationDataModel.fromJsonList(response.data['data']);
  }
}
