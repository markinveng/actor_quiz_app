import 'package:flutter/material.dart';

String convertName(List<TextEditingController> answer) {
  //入力内容を名前に戻す
  List<String> answerList = [];
  for (int i = 0; i < answer.length; i++) {
    answerList.add(answer[i].text);
  }
  return answerList.sublist(0, answerList.length - 1).join(' ') +
      (' ') +
      answerList.last;
}

String judgeName(String name, String answerResult) {
  //正誤の判定
  String nameCorrectIncorrect;
  if (name.toLowerCase() == answerResult.toLowerCase()) {
    nameCorrectIncorrect = 'Correct';
  } else {
    nameCorrectIncorrect = 'Incorrect';
  }
  return nameCorrectIncorrect;
}

int getCorrectNum(List<String> resultList) {
  int num = 0;
  for (int i = 0; i < resultList.length; i++) {
    if (resultList[i].contains('Correct')) {
      num++;
    }
  }
  return num;
}
