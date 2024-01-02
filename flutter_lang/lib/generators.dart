library flutter_lang;

import 'package:build/build.dart';
import 'package:flutter_lang/src_new/lang_generator.dart';
import 'package:source_gen/source_gen.dart';

export 'src/custom_annotation.dart';
export 'src_new/annotations.dart';

// Builder generateJsonMethods(BuilderOptions options) {
//   // Step 1
//   return SharedPartBuilder(
//     [JsonGenerator()], // Step 2
//     'json_generator', // Step 3
//   );
// }

Builder generateFlutterLanguages(BuilderOptions options) {
  // Step 1
  return LibraryBuilder(
    LanguageGenerator(), // Step 2
    additionalOutputExtensions: ['.lang.g.dart'], // Step 3
  );
}
