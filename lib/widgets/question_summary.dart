import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => SummaryItem(itemData: data),
              )
              .toList(),
        ),
      ),
    );
  }
}
