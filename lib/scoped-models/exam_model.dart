import 'dart:convert';
import 'package:readathon/models/exam_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExamModel extends Model{
  List<Exam> _exams = [];
  bool _isLoading = false;
  
  bool get isLoading{
    return _isLoading;
  }

  List<Exam> get exams{
    return List.from(_exams);
  }

  void fetchExams() async{
    _isLoading = true;
    notifyListeners();

    try{
      SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
      String authToken = _sharedPrefs.getString("auth_token");
      //String authToken = "4914d556c7850d23588d5ec2330275d6113f3e5d";
      String url = "https://e-funza.herokuapp.com/api/exams-api/";
      // url = "http://10.0.2.2:8000/api/exams-api/";
      final headers = <String, String>{'Authorization': 'Token '+ authToken,
                                       'Content-Type': 'application/json',
                                       'Accept': 'application/json',};
      final http.Response response = await http.get(Uri.encodeFull(url), headers:headers);
      
      final List<dynamic> fetchedData = json.decode(response.body);      
      final List<Exam> examItems = [];
      
      fetchedData.forEach((dynamic examData){
        Exam examItem = Exam(
          id: examData["id"].toString(),
          title: examData["title"],
          author: examData["author"],
          topic: examData["topic_id"].toString(),
          dateAdded: examData["date_added"],
          // content: examData["content"],
        );
        examItems.add(examItem);
      });
      _exams = examItems;
      _isLoading = false;
      notifyListeners();
      //return Future.value(true);
    }
    catch(e){
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text(e.toString()),
      // ));
      print("error : " + e.toString());
      _isLoading = false;
      notifyListeners();
      //return Future.value(false);
    }
  }
}
