import 'package:flutter/material.dart';
import './question.dart';

class QuestionsTab extends StatefulWidget {
  @override
  _QuestionsTabState createState() => _QuestionsTabState();
}

class _QuestionsTabState extends State<QuestionsTab> {
  @override




  Widget build(BuildContext context) {
      Question q = new Question("how old is Will", ["17", "18", "19", "20"], 2);
      List choices = q.getChoices;
      List radioTiles = choices.map((choice) => RadioListTile(
          title: Text(choice)
        )
      ).toList();
      return Column(
    children: <Widget>[
      ...radioTiles
      // RadioListTile(
      //   title: const Text('Lafayette'),
      // ),
      // RadioListTile(
      //   title: const Text('Thomas Jefferson') 
      // ),
    ],
  );
  }
}
