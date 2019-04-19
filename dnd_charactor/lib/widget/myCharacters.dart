import 'package:dnd_charactor/localization/translations.dart';
import 'package:flutter/material.dart';

class MyCharactersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(Translations.text("characterList")),
      ),
      body: Center(
        child: MaterialButton(
            child: new Text("button"),
            onPressed: () {
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2018),
                  lastDate: DateTime(2030));
            }),
      ),
    );
  }
}
