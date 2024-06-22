import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:helping_hands/Features/Home/presentation/home.dart';
import 'package:helping_hands/Features/Splash/SplashView.dart';
import 'package:helping_hands/Features/auth/presentation/LoginScreen.dart';
import 'package:helping_hands/Features/chat/presentation/ChatPage.dart';
import 'package:helping_hands/core/utils/theme.dart';
import 'package:helping_hands/generated/l10n.dart';

class Materialapp extends StatelessWidget {
  const Materialapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? language;
    String myString = View.of(context).platformDispatcher.locale.toString();
    if (myString.contains('ar')) {
      language = 'ar';
    } else {
      language = 'en';
    }
    // String? theme = 'light';
    // return BlocConsumer<LanguageCubit, LanguageState>(
    //   listener: (context, state) {
    //     if (state is LanguageChanged) {
    //       language = state.languageCode;
    //     }
    // } else if (state is ThemeChanged) {
    //   theme = state.theme;
    // }
    //   builder: (context, state) {
    // BlocProvider.of<LanguageCubit>(context).gettheme();
    //     BlocProvider.of<LanguageCubit>(context).getLocale();

    return MaterialApp(
      // theme: theme == 'light' ? lightMode : darkMode,
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/LoginPage': (context) => LoginScreen(),
        '/ChatPage': (context) => ChatPage(),
        '/HomePage': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
      locale: Locale(language),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const SplashView(),
    );
    // },
    // );
  }
}
