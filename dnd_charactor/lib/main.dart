import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/translations.dart';
import 'widget/myCharacters.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

typedef void LocaleChangedCallback(Locale locale);

class AppSetting {
  static const Locale ZH = Locale('zh', 'CH');
  static const Locale EN = Locale('en', 'US');
  List<Locale> supportedLocales = [ZH, EN];

  static final AppSetting _appSetting = new AppSetting._internal();

  factory AppSetting() => _appSetting;

  AppSetting._internal();

  LocaleChangedCallback changeLocale;
}

AppSetting appSetting = new AppSetting();

class AppState extends State<MyApp> {
  Locale _locale;

  @override
  void initState() {
    super.initState();
    appSetting.changeLocale = (Locale locale) {
      setState(() {
        _locale = locale;
        Translations.load(locale);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    AppSetting();
    return MaterialApp(
      // ignore: non_constant_identifier_names
      onGenerateTitle: (BuildContext) {
        return Translations.text("myApp");
      },
      locale: _locale,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyCharactersWidget(),
      localizationsDelegates: [
        TranslationDelegate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppSetting().supportedLocales,
    );
  }
}
