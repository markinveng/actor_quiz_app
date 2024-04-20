abstract class AnswerUserCaseInterface {
  void addAnswer(Object answer);
  List<String>? fetchAnswerList();
  int? fetchAnswerLength();
  void initializeAnswer();
}