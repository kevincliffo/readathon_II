class HTMLParser{
  String htmlString;
  List<String> singleQuestions = new List<String>();

  HTMLParser(String string)
  {
    htmlString = string;
  }

  void removeOLTags()
  {
    htmlString = htmlString.replaceAll("<ol>", "").replaceAll("</ol>", "");
  }

  void createQuestionsList()
  {
    List<String> questions;

    questions = htmlString.split('</li>');
    String singleQuestion;

    questions.forEach((String question) { 
      singleQuestion = htmlString.replaceAll("<li>", "").replaceAll("</li>", "").replaceAll("<p>", "")
                     .replaceAll("</p>", "").replaceAll("/n", "").replaceAll("&quot;", '"')
                     .replaceAll("&nbsp;", ' ').replaceAll("&#39;", "'").replaceAll("<br />", "");
      singleQuestions.add(singleQuestion);
    });
  }

  List<String> get questions{
    return List.from(singleQuestions);
  }
}