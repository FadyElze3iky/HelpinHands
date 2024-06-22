import 'package:bloc/bloc.dart';
import 'package:helping_hands/language_theme_cubit/language_cubit_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  void changeLanguage(String languageCode) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', languageCode);
      getLocale();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'en';
    emit(LanguageChanged(languageCode));
  }

  void changeTheme() async {
    try {
      String currentTheme = await gettheme();
      if (currentTheme == 'light') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('theme', 'dark');
        gettheme();
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('theme', 'light');
        gettheme();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<String> gettheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString('theme') ?? 'light';
    emit(ThemeChanged(theme));
    return theme;
  }
}
