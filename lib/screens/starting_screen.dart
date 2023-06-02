import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({
    Key? key,required this.startQuiz,}) : super(key: key);

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(255, 139, 86, 230),
          ),
          const SizedBox(
            height: 50,
          ),
           Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.pacifico(
              fontSize: 24,
              color: const Color.fromARGB(255, 171, 138, 227),
            )
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start'),
          )
        ],
      ),
    );
  }
}
