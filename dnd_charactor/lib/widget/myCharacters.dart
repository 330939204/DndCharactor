import 'package:dnd_charactor/localization/translations.dart';
import 'package:dnd_charactor/main.dart';
import 'package:flutter/material.dart';

class MyCharactersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(Translations.of(context).text("characterList")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text(Translations.of(context).text('zh')),
              onPressed: () {
                appSetting.changeLocale(Locale('zh'));
              },
            ),
            MaterialButton(
              child: Text(Translations.of(context).text('en')),
              onPressed: () {
                appSetting.changeLocale(Locale('en'));
              },
            )
          ],
        ),
      ),
    );
  }
}
