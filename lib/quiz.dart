import 'package:flutter/material.dart';
import 'package:quiz_project/questions_screen.dart';
import 'package:quiz_project/results_screen.dart';
import 'package:quiz_project/start_screen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  // Widget? activeScreen;
  var activeScreen = 'Start_Screen';

/*
  @override
  void initState() {
    super.initState();
    //activeScreen  = StartScreen(switchScreen);
    activeScreen = 'Questions_Screen';

  }*/

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionsScreen();
      activeScreen = 'Questions_Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'Results_Screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'Questions_Screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'Results_Screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 78, 15, 168)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget
          /*activeScreen == 'Start_Screen'
              ? StartScreen(switchScreen)
              : const QuestionsScreen()*/
          ,
        ),
      ),
    );
  }
}
