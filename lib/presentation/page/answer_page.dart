import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../application/actor_data_provider.dart';
import '../widgets/input_name_field.dart';

class AnswerPage extends ConsumerWidget {
  const AnswerPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    final actorProvider = ref.watch(actorDataProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).questionActorText),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: actorProvider.when(
        skipLoadingOnRefresh: false,
        data: (data) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                screenWidth * 0.03, screenHeight * 0, screenWidth * 0.03, 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.5,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w780${data.profilePath}',
                    ),
                  ),
                  InputNameField(
                    id: data.id.toString(),
                    name: data.name.toString(),
                    profilePath: data.profilePath.toString(),
                  ),
                ],
              ),
            ),
          ),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).errorDataFetch,
                style:const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                AppLocalizations.of(context).errorRestart,
                style:const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              ElevatedButton(
                onPressed: () => {
                  ref.invalidate(actorDataProvider)
                },
                child: Text(
                  AppLocalizations.of(context).restart,
                ),
              )
            ],
          ),
        ),
        loading: () => Container(
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.03, screenHeight * 0, screenWidth * 0.03, 0),
          child: const Center(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                height: 300,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
