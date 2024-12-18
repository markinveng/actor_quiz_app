abstract class AnswerUserCaseInterface {
  void setAnswerType(int flg);
  int? getAnswerType(pref);
  void addAnswer(Object answer);
  List<String>? fetchAnswerList();
  int? fetchAnswerLength();
  void initializeAnswer();
}