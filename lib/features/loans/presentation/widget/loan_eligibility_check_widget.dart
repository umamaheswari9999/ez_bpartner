import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_eligibility_limit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:ez_flutter/shared/model/loan_eligibility.dart';
import 'package:ez_flutter/shared/widget/empty_list_widget.dart';
import 'package:ez_flutter/shared/widget/failure_widget.dart';
import 'package:ez_flutter/shared/widget/loading_widget.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoanEligibilityCheckWidget extends StatelessWidget {
  const LoanEligibilityCheckWidget({Key? key, required this.loanId})
      : super(key: key);

  final String loanId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewLoanActionCubit, NewLoanActionState>(
      listener: (ctx, state) {
        state.maybeWhen(
          success: (action, data) {
            if (action == NewLoanAction.checkCibilLimit && data != null) {
              final limits = data['limits'] as LoanEligibilityLimit;
              if (limits.cibilDecision == LoanEligibility.refer ||
                  limits.cibilDecision == LoanEligibility.rejected) {
                final details = locator.get<AppStaticData>();

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (ctx) => AlertDialog(
                    title: CircleAvatar(
                      radius: 24,
                      backgroundColor: Theme.of(context).colorScheme.error,
                      child: const Icon(Icons.warning_amber_rounded),
                    ),
                    content: ListTile(
                      title: Text(
                        limits.finalDecision == LoanEligibility.rejected
                            ? 'This consumer is not eligible for the loan. For more information contact'
                            : limits.finalDecision == LoanEligibility.eligible
                                ? 'Congrajulations..! You are eligible for this loan.'
                                : 'To continue on this loan, please contact our support team on',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            details.contactUsNumber,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            details.contactUsEmail,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      PrimaryButton(
                        text: 'OKAY',
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ).then((value) {
                  Navigator.of(context).pop(LoanEligibilityStatus.notEligible);
                });
              } else if (limits.cibilDecision == LoanEligibility.eligible) {
                Navigator.of(context).pop(true);
              }
            }
          },
          orElse: () {},
        );
      },
      builder: (ctx, state) {
        return state.when(
          initial: () => const LoadingWidget(),
          loading: (action) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Please wait, checking loan eligibility...'),
              SizedBox(height: 6),
              LoadingWidget(),
            ],
          ),
          success: (action, data) {
            if (data != null) {
              final limits = data['limits'] as LoanEligibilityLimit;

              if (limits.cibilDecision == LoanEligibility.eligible) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ListTile(
                          leading: Icon(Icons.info_outline),
                          title: Text(
                            'Loan Eligibility check completed successfully',
                          ),
                        ),
                        const SizedBox(height: 6),
                        PrimaryButton(
                          text: 'CONTINUE',
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    'Unfortunately, you are not eligible for the loan.',
                  ),
                );
              }
            }
            return EmptyListWidget(
              message: 'No eligibility data found',
              onRefresh: () {
                BlocProvider.of<NewLoanActionCubit>(context)
                    .checkCibilLimit(loanId);
              },
            );
          },
          failure: (action, f) {
            if (action == NewLoanAction.checkCibilLimit) {
              return Center(
                child: FailureWidget(
                  failure: f,
                  text: 'CONTINUE',
                  onRefresh: () {
                    BlocProvider.of<NewLoanActionCubit>(context)
                        .checkCibilLimit(loanId);
                  },
                ),
              );
            }
            return const SizedBox(width: 0, height: 0);
          },
        );
      },
    );
  }
}
