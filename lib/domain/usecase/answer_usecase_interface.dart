abstract class AnswerUserCaseInterface {
  void setAnswerType(int flg);
  void addAnswer(Object answer);
  List<String>? fetchAnswerList();
  int? fetchAnswerLength();
  void initializeAnswer();
}