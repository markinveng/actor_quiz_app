import 'dart:convert';

import 'package:actor_quiz_app/application/usecase/answer_usecase.dart';
import 'package:actor_quiz_app/core/method/answer_method.dart';
import 'package:actor_quiz_app/core/router/go_router.dart';
import 'package:actor_quiz_app/domain/usecase/answer_usecase_interface.dart';
import 'package:actor_quiz_app/presentation/state/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pref = ref.read(sharedPreferencesProvider);
    AnswerUserCaseInterface answerUsecase = AnswerUseCaseImpl(pref: pref);
    List<String>? resultItem = answerUsecase.fetchAnswerList();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).result),
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${AppLocalizations.of(context).score} : ${getCorrectNum(resultItem!)}/10',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => popUntilRoot(),
                  child: Text(AppLocalizations.of(context).back),
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.09),
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return ResultCard(resultItem: resultItem[index]);
            }, childCount: resultItem.length),
          )
        ],
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  const ResultCard({super.key, required this.resultItem});
  final String resultItem;
  @override
  Widget build(BuildContext context) {
    final resultObj = json.decode(resultItem);
    return Column(children: [
      SizedBox(
        height: 300,
        child: Card(
          margin: const EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Theme.of(context).colorScheme.onInverseSurface,
          child: Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                  aspectRatio: 0.8 / 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w780${resultObj['imgPath']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  resultObj['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  resultObj['judge'],
                  style: TextStyle(
                    color: resultObj['judge'] != "Correct"
                        ? Colors.red
                        : Colors.lightGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
