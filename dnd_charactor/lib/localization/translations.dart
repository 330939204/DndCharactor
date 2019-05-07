import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

class Translations {
  Map<dynamic, dynamic> _localizedValue;

  Translations(this._localizedValue);

  String text(String key) {
    return _localizedValue[key];
  }

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static Future<Translations> load(Locale locale) async {
    try {
      String jsonContent = await rootBundle
          .loadString("locale/i18n_${locale.languageCode}.json");
      return Translations(json.decode(jsonContent));
    } catch (e) {
      return null;
    }
  }
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
