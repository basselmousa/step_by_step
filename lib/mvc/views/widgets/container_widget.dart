import 'package:flutter/material.dart';
import 'package:step_by_step/mvc/helpers/constants/font_constants.dart';

Padding buildContainer(String text, Function function) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Container(
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        child: Text("$text"),
        style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey,
          onPrimary: Colors.black45,
          textStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: FontConstants.TEXT_Font20),
        ),
      ),
    ),
  );
}
