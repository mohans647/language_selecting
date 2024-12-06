import 'package:shared_preferences/shared_preferences.dart';

class LanguageRepository {
  static const _languageKey = "selected_language";

  Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
    print("Language saved: $languageCode");
  }

  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final language = prefs.getString(_languageKey) ?? "en";
    print("Language retrieved: $language");
    return language;
  }
}
