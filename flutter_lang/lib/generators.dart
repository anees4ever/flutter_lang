library flutter_lang;

import 'package:build/build.dart';
import 'package:flutter_lang/src_new/lang_generator.dart';
import 'package:source_gen/source_gen.dart';

export 'src_new/annotations.dart';

Builder generateFlutterLanguages(BuilderOptions options) {
  // Step 1
  return LibraryBuilder(
    LanguageGenerator(),
    generatedExtension: '.core.g.dart', // Step 2
    additionalOutputExtensions: ['.lang.g.dart', '.state.g.dart'], // Step 3
  );
}
