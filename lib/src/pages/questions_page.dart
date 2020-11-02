import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => 
          Card(            
            elevation: 0.0,
            child: Column(
              children: [
                ListTile(
                  title:Text(
                    "Question",
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