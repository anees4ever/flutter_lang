import 'package:flutter_lang/model/language_model.dart';
import 'package:flutter_lang/model/localization_data_model.dart';

abstract class ApiAbstract {
  void setParams(String apiKey, String apiEndpoint);
  Future<List<LanguagesModel>> getLanguages();
  Future<List<LocalizationDataModel>> getLanguageData();
}
