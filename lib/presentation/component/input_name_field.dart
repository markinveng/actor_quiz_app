import 'package:actor_quiz_app/application/usecase/answer_usecase.dart';
import 'package:actor_quiz_app/core/method/answer_method.dart';
import 'package:actor_quiz_app/domain/usecase/answer_usecase_interface.dart';
import 'package:actor_quiz_app/presentation/state/actor_data_provider.dart';
import 'package:actor_quiz_app/presentation/state/answer_provider.dart';
import 'package:actor_quiz_app/presentation/state/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class InputNameField extends ConsumerWidget {
  const InputNameField(
      {super.key,
      required this.id,
      required this.name,
      required this.profilePath});
  final String id;
  final String name;
  final String profilePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> nameArray = name.split(" ");
    List<TextEditingController> answer =
        ref.watch(answerProvider(nameArray.length));
    final pref = ref.watch(sharedPreferencesProvider);
    AnswerUserCaseInterface answerUseCase = AnswerUseCaseImpl(pref: pref);
    return SizedBox(
      width: 300,
      height: 200,
      child: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: 300,
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: nameArray.length,
                itemBuilder: (BuildContext context, int index) {
                  Size screenSize = MediaQuery.of(context).size;
                  double screenWidth = screenSize.width;
                  final String nameType;
                  if (index == 0) {
                    nameType = AppLocalizations.of(context).inputNameFirstName;
                  } else if (index == nameArray.length - 1) {
                    nameType = AppLocalizations.of(context).inputNameLastName;
                  } else {
                    nameType = AppLocalizations.of(context).inputNameMiddleName;
                  }
                  double inputWidth =
                      screenWidth / (nameArray[index].length * 1.5);
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: PinCodeTextField(
                          controller: answer[index],
                          autoDisposeControllers: true,
                          appContext: context,
                          length: nameArray[index].length,
                          keyboardType: TextInputType.name,
                          enableActiveFill: true,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderWidth: 1.0,
                            borderRadius: BorderRadius.circular(10),
                            selectedFillColor: Colors.white,
                            inactiveFillColor: Colors.grey,
                            fieldWidth: inputWidth,
                            fieldHeight: 50,
                            activeFillColor: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text(nameType)],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Object result = {
                "id": id,
                "name": name,
                "answer": convertName(answer),
                "imgPath": profilePath,
                "judge": judgeName(name, convertName(answer))
              };
              answerUseCase.addAnswer(result);
              if (answerUseCase.fetchAnswerLength()! >= 10) {
                context.go('/result-page');
              } else {
                ref.invalidate(actorDataProvider);
              }
            },
            child: Text(
              AppLocalizations.of(context).answerButton,
            ),
          )
        ],
      ),
    );
  }
}
