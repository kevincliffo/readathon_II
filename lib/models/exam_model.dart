import 'package:readathon/models/exam_question_model.dart';

class Exam{
  final String id;
  final String title;
  final String author;
  final String topic;
  final String dateAdded;
  final List<ExamQuestion> questions;

  Exam({this.id, this.title, this.author, this.topic, this.dateAdded, this.questions});
}