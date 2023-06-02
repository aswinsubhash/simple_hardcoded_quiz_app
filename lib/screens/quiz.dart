import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/starting_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';
  List<String> selectedAnswers = [];

  void startQuiz() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswers(String answers) {
    selectedAnswers.add(answers);
    log(selectedAnswers.toString());

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  void retry() {
    setState(() {
    selectedAnswers = [];
    activeScreen = 'question_screen';
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: activeScreen == 'question_screen'
            ? QuestionScreen(
                onSelectAnswer: chooseAnswers,
              )
            : activeScreen == 'result_screen'
                ? ResultScreen(
                    selectedAnswers: selectedAnswers,
                    onRetry: retry,
                  )
                : StartingScreen(startQuiz: startQuiz),
      ),
    );
  }
}
