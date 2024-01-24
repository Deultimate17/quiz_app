import 'package:flutter/material.dart';
import 'package:qiii_app/question_model.dart';
import 'package:qiii_app/quiz_app.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      home: QuizApp(),
    )
  );
}
