import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutter_lang/generators.dart';
import 'package:flutter_lang/mock/mock_api.dart';
import 'package:flutter_lang/model/language_model.dart';
import 'package:flutter_lang/model/localization_data_model.dart';
import 'package:flutter_lang/src_new/generator_classes.dart';
import 'package:flutter_lang/src_new/generator_state_getx.dart';
import 'package:flutter_lang/src_new/generator_helper.dart';
import 'package:flutter_lang/src_new/generator_state_provider.dart';
import 'package:source_gen/source_gen.dart';

class LanguageGenerator extends GeneratorForAnnotation<FlutterLangSingleton> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final outputId = AssetId(buildStep.inputId.package,
        buildStep.inputId.path.replaceFirst('.dart', '.lang.g.dart'));

    // Buffer to write each part of generated class
    final buffer = StringBuffer();

    int source = annotation.read('source').intValue;
    String localFile = annotation.read('localFile').stringValue;
    String apiEndpoint = annotation.read('apiEndpoint').stringValue;
    String apiKey = annotation.read('apiKey').stringValue;
    String lang = annotation.read('defaultLanguage').stringValue;
    String className = annotation.read('className').stringValue;
    className = className.isEmpty
        ? element.runtimeType.toString() + 'Helper'
        : className;
    int stateManagement = annotation.read('stateManagement').intValue;

    List<LanguagesModel> available_languages = [];
    List<LocalizationDataModel> localizations = [];

    if (source == LanguageSource.LOCAL) {
      if (localFile.isEmpty) {
        throw Exception('localFile cannot be empty');
      }
      //read the file contents from localFile path
      String fileContents = await buildStep
          .readAsString(AssetId(buildStep.inputId.package, localFile));
      Map<String, dynamic> json = jsonDecode(fileContents);

      available_languages =
          LanguagesModel.fromJsonList(json['available_languages']);
      localizations =
          LocalizationDataModel.fromJsonList(json['localization_data']);
    } else if (source == LanguageSource.API) {
      MockApi mockApi = MockApi();
      mockApi.setParams(apiKey, apiEndpoint);
      available_languages = await mockApi.getLanguages();
      localizations = await mockApi.getLanguageData();
    }

    HelperGenerator helperGenerator = HelperGenerator(
        parentClass: className,
        langClassImport:
            '${buildStep.inputId.package}/${outputId.path.replaceFirst('lib/', '')}',
        defaultLanguage: lang,
        availableLanguages: available_languages);
    helperGenerator.generate(localizations, stateManagement);

    ClassGenerator classGenerator = ClassGenerator(
        parentClass: className,
        langClassImport:
            '${buildStep.inputId.package}/${buildStep.inputId.path.replaceFirst('lib/', '').replaceFirst('.dart', '.core.g.dart')}',
        defaultLanguage: lang,
        availableLanguages: available_languages);

    classGenerator.generateClasses(localizations);

    String generatedFromJSon = '';
    generatedFromJSon += classGenerator.generatedClassesAsString + '\n\n';

    buffer.writeln(generatedFromJSon);

    await buildStep.writeAsString(outputId, buffer.toString());

    String generatedStateFromHelper = '';
    switch (stateManagement) {
      case StateManagement.GETX:
        GeneratorStateGetX providerGetX = GeneratorStateGetX(
          parentClass: className,
          defaultLanguage: lang,
        );
        providerGetX.generate();
        generatedStateFromHelper = providerGetX.generatedClassData;
        break;
      case StateManagement.PROVIDER:
        GeneratorStateProvider providerGenerator = GeneratorStateProvider(
          parentClass: className,
          defaultLanguage: lang,
        );
        providerGenerator.generate();
        generatedStateFromHelper = providerGenerator.generatedClassData;
        break;
    }

    if (generatedStateFromHelper.isNotEmpty) {
      final outputIdState = AssetId(buildStep.inputId.package,
          buildStep.inputId.path.replaceFirst('.dart', '.state.g.dart'));
      await buildStep.writeAsString(outputIdState, generatedStateFromHelper);
    }

    return helperGenerator.generatedData;
  }
}
