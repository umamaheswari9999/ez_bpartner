import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/add_note/add_note_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/kyc_check/kyc_check_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/screen/chat_screen.dart';
import 'package:ez_flutter/features/loans/presentation/screen/new_consumer_loan/step_decider_screen.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<bool?> askForKycSkip(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (ctx2) {
      return AlertDialog(
        title: const Text('It is not recommended to skip the Aadhar KYC. Do you really want to skip?'),
        actions: [
          PrimaryButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            text: 'NO',
          ),
          PrimaryButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            text: 'YES',
            elevation: 0,
            primary: Colors.black,
          ),
        ],
      );
    },
  );
}

void openLoanStepDecider(BuildContext context, String preEnquiryNumber, String poiNumber) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx2) => locator.get<KycCheckCubit>()),
          BlocProvider(create: (ctx2) => locator.get<NewLoanCubit>()),
          BlocProvider(
              create: (ctx2) =>
                  locator.get<NewLoanActionCubit>()..checkLoanStatusAndSetStep(preEnquiryNumber, poiNumber)),
        ],
        child: NewLoanStepDeciderScreen(
          poiNumber: poiNumber,
          loanNumber: preEnquiryNumber,
        ),
      ),
    ),
  ).then((value) {
    // BlocProvider.of<RecentLoansCubit>(context).fetchRecentLoans(Fil);
  });
}

void openChatScreen(BuildContext context, String loanId, String loanNumber) {
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx2) => locator.get<NotesCubit>()..fetchInitial(loanId)),
        BlocProvider(create: (ctx2) => locator.get<AddNoteCubit>())
      ],
      child: ChatScreen(
        loanId: loanId,
        loanNumber: loanNumber,
      ),
    );
  }));
}
