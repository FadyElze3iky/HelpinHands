abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageChanged extends LanguageState {
  final String languageCode;

  LanguageChanged(this.languageCode);
}

class ThemeChanged extends LanguageState {
  final String theme;

  ThemeChanged(this.theme);
}
