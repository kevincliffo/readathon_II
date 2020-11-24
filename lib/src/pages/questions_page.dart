import 'package:flutter/material.dart';
import 'package:readathon/models/exam_model.dart';

class QuestionsPage extends StatefulWidget {
  final Exam exam;
  QuestionsPage({this.exam});
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    print("widget.exam.questions[index].question.length : " + widget.exam.questions.length.toString());
    return Scaffold(
      body:ListView.builder(
        itemCount: widget.exam.questions.length,
        itemBuilder: (context, index) =>
          Card(
            elevation: 0.0,
            child: Column(
              children: [
                ListTile(
                  title:Text(
                    widget.exam.questions[index].question,
                    style:Theme.of(context).textTheme.headline6,
                  ),
                  leading: Text((index + 1).toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
    );
  }
}