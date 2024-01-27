import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/shared_preferences_provider.dart';
import '../../data/repositories/answer_repository.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pref = ref.read(sharedPreferencesProvider);
    AnswerRepository answerRepository = AnswerRepository(pref: pref);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                answerRepository.initializeAnswer();
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
