import 'package:flutter/material.dart';

class QuestionsAnswersScreen extends StatefulWidget {
  final List<String> questionsData;
  const QuestionsAnswersScreen({
    super.key,
    required this.questionsData,
  });

  @override
  State<QuestionsAnswersScreen> createState() => _QuestionsAnswersScreenState();
}

class _QuestionsAnswersScreenState extends State<QuestionsAnswersScreen> {
  List<dynamic> items = [
    'Type of Loan',
    'Your work Profile',
    'Family income',
    'Existing bank where loan existse',
    'Property located state',
    'Property located city'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question And answers'),
      ),
      body: ListView.builder(
          itemCount: widget.questionsData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Question :- ${items[index]}'),
              subtitle: widget.questionsData[index].isEmpty
                  ? const Text('Empty')
                  : Text('Answer :- ${widget.questionsData[index]}'),
            );
          }),
    );
  }
}
