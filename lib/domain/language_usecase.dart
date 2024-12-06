import '../data/language_repository.dart';

class LanguageUseCase {
  final LanguageRepository _repository;

  LanguageUseCase(this._repository);

  Future<void> saveLanguage(String languageCode) {
    return _repository.saveLanguage(languageCode);
  }

  Future<String?> getLanguage() {
    return _repository.getLanguage();
  }
}
