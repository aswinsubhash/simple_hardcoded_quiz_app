
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/custom_answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    Key? key,
    required this.onSelectAnswer,
  
  }) : super(key: key);

  final void Function(String answer) onSelectAnswer;



  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void nextQuestion(String answers) {
    widget.onSelectAnswer(answers);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 176, 143, 232),
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map((answers) {
            return AnswerButton(
              onTap: (){
                nextQuestion(answers);
              },
              answers: answers,
            );
          })
        ],
      ),
    );
  }
}
