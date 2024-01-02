library flutter_lang;

import 'package:build/build.dart';
import 'package:flutter_lang/src_new/lang_generator.dart';
import 'package:source_gen/source_gen.dart';

export 'src/custom_annotation.dart';
export 'src_new/annotations.dart';

Builder generateFlutterLanguages(BuilderOptions options) {
  // Step 1
  return LibraryBuilder(
    LanguageGenerator(), // Step 2
    additionalOutputExtensions: ['.lang.g.dart', '.provider.g.dart'], // Step 3
  );
}
