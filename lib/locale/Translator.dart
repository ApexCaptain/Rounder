import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translator {
  final Locale locale;

  Translator(this.locale);

  static Translator of(BuildContext context) =>
      Localizations.of<Translator>(context, Translator);

  Map<String, String> _messages;

  Future<bool> load() async {
    String data = await rootBundle
        .loadString("assets/locale/${this.locale.languageCode}.json");
    Map<String, dynamic> _result = json.decode(data);
    this._messages = new Map();
    _result.forEach((key, value) {
      this._messages[key] = value.toString();
    });
    return true;
  }

  String get(String key) => this._messages[key];
}

class TranslatorDelegate extends LocalizationsDelegate<Translator> {
  const TranslatorDelegate();
  static const supportedLocales = [
    "ko",
    "en",
  ];

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale.languageCode);

  @override
  Future<Translator> load(Locale locale) async {
    Translator _translator = new Translator(locale);
    await _translator.load();
    return _translator;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Translator> old) => false;

}
