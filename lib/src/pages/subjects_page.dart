import 'package:flutter/material.dart';
import 'package:readathon/src/pages/questions_list_page.dart';
import 'package:readathon/src/widgets/subject_list_tile.dart';

class SubjectsPage extends StatefulWidget {
  SubjectsPage({Key key}) : super(key: key);

  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:5.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child:Column(
          children: <Widget>[
            GestureDetector(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuestionsListPage() ));
              },
              child: SubjectListTile(
                icon:Icons.book, 
                text:"E-Readathon"
              ),
            ),
            Divider(height:10.0, color:Colors.grey,),
            GestureDetector(
              onTap: (){
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("E-Lab To be implemented"),
                ));
              },
              child: SubjectListTile(
                icon:Icons.local_hospital, 
                text:"E-Lab"
              ),
            ),
            Divider(height:10.0, color:Colors.grey,),
          ],
        ),
      ),
    );
  }
}