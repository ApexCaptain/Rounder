import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rounder/locale/Translator.dart';

void main() async {
  runApp(MaterialApp(
    title: "Rounder",
    home: MainPage(),
    localizationsDelegates: [
      const TranslatorDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: TranslatorDelegate
        .supportedLocales
        .map((eachLanguageCode) => Locale(eachLanguageCode)),
    localeResolutionCallback:
        (Locale locale, Iterable<Locale> supportedLocales) {
      if (locale == null) return supportedLocales.first;
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode ||
            supportedLocale.countryCode == locale.countryCode) {
          return supportedLocale;
        }
      }
      return supportedLocales.first;
    },
  ));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              child: Text(""),
              onPressed: () async {
                print(Translator.of(context).get("mainTitle"));
                /*
                  LocalAuthenticator authenticator =
                      LocalAuthenticator.getInstance();
                  print(await authenticator.authenticate(context));
                  */
              },
            ),
          ],
        ),
      ),
    );
  }
}
