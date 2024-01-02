import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:flutter_lang/generators.dart';
import 'package:flutter_lang/src/model_visitor.dart';
import 'package:flutter_lang/src_new/generator_classes.dart';
import 'package:flutter_lang/src_new/generator_helper.dart';
import 'package:flutter_lang/src_new/lang_demo.dart';
import 'package:source_gen/source_gen.dart';

class LanguageGenerator extends GeneratorForAnnotation<FlutterLangSingleton> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final ModelVisitor visitor = ModelVisitor();
    // Visit class fields and constructor
    element.visitChildren(visitor);

    final outputId = AssetId(buildStep.inputId.package,
        buildStep.inputId.path.replaceFirst('.dart', '.lang.g.dart'));

    // Buffer to write each part of generated class
    final buffer = StringBuffer();

    String api = annotation.read('apiEndpoint').stringValue;
    String key = annotation.read('apiKey').stringValue;
    String lang = annotation.read('defaultLanguage').stringValue;
    String className = annotation.read('className').stringValue;
    className = className.isEmpty ? visitor.className + 'Helper' : className;

    HelperGenerator helperGenerator = HelperGenerator(
        parentClass: className,
        langClassImport:
            '${buildStep.inputId.package}/${outputId.path.replaceFirst('lib/', '')}',
        defaultLanguage: lang,
        availableLanguages: available_languages);
    helperGenerator.generate(demo_data);

    ClassGenerator classGenerator = ClassGenerator(
        parentClass: className,
        langClassImport:
            '${buildStep.inputId.package}/${buildStep.inputId.path.replaceFirst('lib/', '').replaceFirst('.dart', '.g.dart')}',
        defaultLanguage: lang,
        availableLanguages: available_languages);

    classGenerator.generateClasses(demo_data);

    String generatedFromJSon = '';
    generatedFromJSon += classGenerator.generatedClassesAsString + '\n\n';

    generatedFromJSon +=
        '/// final String className= "${visitor.className}"; \n';
    generatedFromJSon += '/// final String api= "$api"; \n';
    generatedFromJSon += '/// final String key= "$key"; \n';
    generatedFromJSon += '/// final String lang= "$lang"; \n\n';

    buffer.writeln(generatedFromJSon);

    await buildStep.writeAsString(outputId, buffer.toString());

    return helperGenerator.generatedData;
  }
}
