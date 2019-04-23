import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

class Translations {
  factory Translations() => _instance;
  static Translations _instance = Translations._internal();

  Translations._internal();

  Locale locale;

  Map<dynamic, dynamic> _localizedValue;

  setUp(Locale locale, String jsonContent) {
    this.locale = locale;
    _localizedValue = json.decode(jsonContent);
  }

  static Translations of(BuildContext context) {
    return Localizations.of(context, Translations);
  }

  static String text(String key) =>
      _instance._localizedValue[key] ?? '$key not found';

  static Future<Translations> load(Locale locale) async {
    try {
      if (locale.languageCode != _instance.locale?.languageCode) {
        String jsonContent = await rootBundle
            .loadString("locale/i18n_${locale.languageCode}.json");
        _instance.setUp(locale, jsonContent);
      }
    } catch (e) {}
    return _instance;
  }

  get currentLanguage => locale.languageCode;
}

class TranslationDelegate extends LocalizationsDelegate<Translations> {
  static TranslationDelegate delegate = TranslationDelegate();

  const TranslationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => true;
}
