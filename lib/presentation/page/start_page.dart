import 'package:actor_quiz_app/domain/repository/answer_repository_interface.dart';
import 'package:actor_quiz_app/infrastructure/repositories/answer_repository.dart';
import 'package:actor_quiz_app/presentation/state/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pref = ref.read(sharedPreferencesProvider);
    AnswerRepositoryInterface answerUseCase = AnswerRepositoryImpl();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                answerUseCase.initializeAnswer(pref);
                context.go('/answer-page');
              },
              child: const Text("Lets's Start!"),
            )
          ],
        ),
      ),
    );
  }
}
