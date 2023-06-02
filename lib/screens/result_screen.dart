import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.selectedAnswers,
    required this.onRetry
  }) : super(key: key);

  final List<String> selectedAnswers;

  final void Function() onRetry;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': selectedAnswers[i]
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalAnswers = questions.length;
    final totalCorrectAnswers = summaryData
        .where((data) => data['selected_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $totalCorrectAnswers out of $totalAnswers questions correctly',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 174, 135, 241),
                  fontSize: 20),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 198, 173, 240)
              ),
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            )
          ],
        ),
      ),
    );
  }
}
