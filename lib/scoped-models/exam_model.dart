import 'dart:convert';
import 'package:readathon/models/exam_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExamModel extends Model{
  List<Exam> _exams = [];
  bool _isLoading = false;
  
  bool get isloading{
    return _isLoading;
  }

  List<Exam> get exams{
    return List.from(_exams);
  }

  Future<bool> fetchExams() async{
    _isLoading = true;
    notifyListeners();

    try{
      SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
      String authToken = _sharedPrefs.getString("auth_token");

      String url = "https://efunza.com/api/exams-api/";
      final headers = <String, String>{'Authorization': 'Token '+ authToken,
                                       'Content-Type': 'application/json; charset=UTF-8'};

      final http.Response response = await http.get(url, headers:headers);
      print('Exams - authToken : ' + authToken);
      print('Exams - response.body : ' + response.body);
      final List<dynamic> fetchedData = json.decode(response.body);
      final List<Exam> examItems = [];
      
      fetchedData.forEach((dynamic examData){
        Exam examItem = Exam(          
          id: examData["id"],
          title: examData["title"],
          author: examData["author"],
          topic: examData["topic"],
          dateAdded: examData["date_added"],
          content: examData["content"],
        );
        examItems.add(examItem);
      });
      _exams = examItems;
      
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    }
    catch(e){
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text(e.toString()),
      // ));
      print("error : " + e.toString());
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }
}
