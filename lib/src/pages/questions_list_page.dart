import 'package:flutter/material.dart';
import 'package:readathon/models/exam_model.dart';
import 'package:readathon/models/exam_question_model.dart';
import 'package:readathon/src/pages/questions_page.dart';
import 'package:readathon/src/utils/colors.dart';
import 'package:readathon/src/utils/basic_components.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionsListPage extends StatefulWidget {

  @override
  _QuestionsListPageState createState() => _QuestionsListPageState();
}

class _QuestionsListPageState extends State<QuestionsListPage> {
  bool isLoading;
  List<Exam> _exams;
  HTMLParser htmlParser;

  @override
  void initState() { 
    super.initState();
    this.fetchExams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
    );
  }

  Widget getBody(){
    if(_exams == null || _exams.contains(null) || _exams.length < 0 || isLoading){
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(primary),));
    }
    return ListView.builder(
      itemCount: _exams.length,
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuestionsPage(exam:_exams[index]) ));
          },
          child: ListTile(
            leading: Text((index + 1).toString()),
            title: Text(
              _exams[index].title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(_exams[index].author),
            //trailing: Text(DateTime.now().toString()),
          ),
        ),
      ),
    );
  }

  fetchExams() async{
    setState(() {
      isLoading = true;
    });

    try{
      SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
      String authToken = _sharedPrefs.getString("auth_token");
      String url = "https://e-funza.herokuapp.com/api/exams-api/";
      // url = "http://10.0.2.2:8000/api/exams-api/";
      final headers = <String, String>{'Authorization': 'Token '+ authToken,
                                       'Content-Type': 'application/json',
                                       'Accept': 'application/json',};
      final http.Response response = await http.get(Uri.encodeFull(url), headers:headers);      
      final List<dynamic> fetchedData = json.decode(response.body);
      
      final List<Exam> examItems = [];
      List<ExamQuestion> examQuestions = new List<ExamQuestion>();
      int counter = 1;
      
      fetchedData.forEach((dynamic examData){
        // print('content - examData : ' + examData["content"].toString());
        htmlParser = new HTMLParser(examData["content"].toString());
        htmlParser.removeOLTags();
        htmlParser.createQuestionsList();

        htmlParser.questions.forEach((String question) { 
          // print('question : ' + question);
          
          ExamQuestion examQuestion = ExamQuestion(
            id: counter.toString(),
            parentId: examData["id"].toString(),
            question: question
          );
          counter = counter + 1;

          examQuestions.add(examQuestion);
        });
        Exam examItem = Exam(
          id: examData["id"].toString(),
          title: examData["title"],
          author: examData["author"],
          topic: examData["topic_id"].toString(),
          dateAdded: examData["date_added"],
          questions:examQuestions
        );
        examItems.add(examItem);
        examQuestions = [];
      });
      setState(() {
        _exams = examItems;
        isLoading = false;
      });
    }
    catch(e){
      print("error : " + e.toString());
      isLoading = false;
    }
  } 
}