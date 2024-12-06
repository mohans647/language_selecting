import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/language_usecase.dart';

class LanguageController extends GetxController {
  final LanguageUseCase _useCase;
  var currentLanguage = "en".obs;

  LanguageController(this._useCase);

  @override
  void onInit() async {
    super.onInit();
    currentLanguage.value = (await _useCase.getLanguage())!;
    updateLocale();
  }

  void updateLocale() {
    final locale = Locale(currentLanguage.value);
    Get.updateLocale(locale);
  }

  Future<void> changeLanguage(String languageCode) async {
    currentLanguage.value = languageCode;
    await _useCase.saveLanguage(languageCode);
    updateLocale();
  }


}
