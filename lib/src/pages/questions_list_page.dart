import 'package:flutter/material.dart';
import 'package:readathon/src/pages/questions_page.dart';

class QuestionsListPage extends StatefulWidget {

  @override
  _QuestionsListPageState createState() => _QuestionsListPageState();
}

class _QuestionsListPageState extends State<QuestionsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Card(
              elevation: 0.0,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuestionsPage() ));
                },
                child: ListTile(
                  leading: Text((index + 1).toString()),
                  title: Text(
                    "Question",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Text(DateTime.now().toString()),
                ),
              ),
            ),
          ),
        ),
    );
  }
}