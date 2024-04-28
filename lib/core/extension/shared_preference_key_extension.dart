extension SharedPreferencesKeyExtension on SharedPreferenceKey {
  static final Map<SharedPreferenceKey, String> keys =
      <SharedPreferenceKey, String>{
    SharedPreferenceKey.answerType: 'answerType',
    SharedPreferenceKey.answerList: 'answerList'
  };

  String get key => keys[this]!;
}

enum SharedPreferenceKey {
  answerType,
  answerList,
}
