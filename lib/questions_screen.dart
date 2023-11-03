import 'package:flutter/material.dart';
import 'package:quiz_project/answer_button.dart';
import 'package:quiz_project/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      //currentQuestionIndex+=1;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //use of .map and ... spread operator
            ...currentQuestion
                .getShuffledAnswers()
                .map((answer) => AnswerButton(
                    text: answer,
                    onTap: () {
                      answerQuestion(answer);
                    })),
            /* AnswerButton(text: currentQuestion.answers[0], onTap: () {}),
            AnswerButton(text: currentQuestion.answers[1], onTap: () {}),
            AnswerButton(text: currentQuestion.answers[2], onTap: () {}),
            AnswerButton(text: currentQuestion.answers[3], onTap: () {}),*/
          ],
        ),
      ),
    );
  }
}
