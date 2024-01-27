import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'answer_provider.g.dart';

@riverpod
class Answer extends _$Answer {
  @override
  List<TextEditingController> build(index){
    return List.generate(
      index,
      (index) => TextEditingController(),
    );
  }

}