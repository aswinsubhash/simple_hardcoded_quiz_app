import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.itemData, super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['selected_answer'] == itemData['correct_answer'];
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: CircleAvatar(
            backgroundColor: isCorrectAnswer ? Colors.green : Colors.red,
            radius: 25,
            child: Text(
              ((itemData['question_index'] as int) + 1).toString(),
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 181, 148, 237)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['selected_answer'] as String,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: isCorrectAnswer ? Colors.deepPurpleAccent : Colors.white,
                   decoration: isCorrectAnswer ? TextDecoration.none : TextDecoration.lineThrough,
                   decorationColor: Colors.red,
                   decorationThickness: 3.0
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                isCorrectAnswer ? '' : itemData['correct_answer'] as String,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        )
      ],
    );
  }
}
