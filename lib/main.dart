import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_selector/translations/AppTranslations.dart';
import 'data/language_repository.dart';
import 'domain/language_usecase.dart';
import 'presentation/controllers/language_controller.dart';

import 'presentation/screens/language_selector_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final languageRepository = LanguageRepository();
  final savedLanguage = await languageRepository.getLanguage();

  final languageUseCase = LanguageUseCase(languageRepository);
  Get.put(LanguageController(languageUseCase));

  runApp(MyApp(savedLanguage: savedLanguage));
}

class MyApp extends StatelessWidget {
  final String savedLanguage;

  MyApp({required this.savedLanguage});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: Locale(savedLanguage),
      home: LanguageSelectorScreen(),
    );
  }
}
