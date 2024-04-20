
import 'package:shared_preferences/shared_preferences.dart';

abstract class AnswerRepositoryInterface {
  void addAnswer(Object answer, SharedPreferences pref);
  List<String>? fetchAnswerList(SharedPreferences pref);
  int? fetchAnswerLength(SharedPreferences pref);
  void initializeAnswer(SharedPreferences pref);
}
