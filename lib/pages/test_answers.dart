import 'package:flutter/material.dart';
import 'package:solution/pages/report.dart' as next;

class Page extends StatelessWidget {

  const Page({
    Key? key, required this.answers
    }) : super(key: key);

  final List<int> answers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Answers'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: answers.length,
          itemBuilder: (context, index) {
            return Text(
                answers[index].toString()
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => next.Report()
                )
              );
          }),

    );
  }
}