import 'package:example/localization/flutter_lang.core.g.dart';
import 'package:example/localization/flutter_lang.state.g.dart';
import 'package:example/src/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() => runApp(GetXExampleApp());
void main() => runApp(const ProviderExampleApp());

// class GetXExampleApp extends StatelessWidget {
//   GetXExampleApp({super.key});

//   final FlutterLanguageGetXController controller =
//       Get.put(FlutterLanguageGetXController(currentLangaugeCode: 'ml'));

//   @override
//   Widget build(BuildContext context) {
//     return GetX<FlutterLanguageGetXController>(
//       builder: (_) => GetMaterialApp(
//         locale: controller.currentLocale.value,
//         localizationsDelegates: FlutterLanguage.localizationsDelegates,
//         supportedLocales: FlutterLanguage.supportedLocales,
//         title: "Flutter_Lang Demo",
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(),
//       ),
//     );
//   }
// }

class ProviderExampleApp extends StatelessWidget {
  const ProviderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TranslationsHelperChangeProvider>(
      create: (context) => TranslationsHelperChangeProvider(
        currentLangaugeCode: 'ml',
      ),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: Provider.of<TranslationsHelperChangeProvider>(context,
                  listen: true)
              .currentLocale,
          localizationsDelegates: TranslationsHelper.localizationsDelegates,
          supportedLocales: TranslationsHelper.supportedLocales,
          title: "Flutter_Lang Demo",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}
