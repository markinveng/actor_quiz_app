import 'package:actor_quiz_app/presentation/page/answer_page.dart';
import 'package:actor_quiz_app/presentation/page/result_page.dart';
import 'package:actor_quiz_app/presentation/page/start_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  // アプリが起動した時
  initialLocation: '/start-page',
  // パスと画面の組み合わせ
  routes: [
    GoRoute(
      path: '/start-page',
      name: 'StartPage',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const StartPage(),
        );
      },
    ),
    GoRoute(
      path: '/answer-page',
      name: 'AnswerPage',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child:const AnswerPage(),
        );
      },
    ),
    GoRoute(
      path: '/result-page',
      name: 'ResultPage',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const ResultPage(),
        );
      },
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
