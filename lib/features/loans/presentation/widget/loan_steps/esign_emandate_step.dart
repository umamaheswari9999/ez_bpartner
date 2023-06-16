import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_steps/emandate_step.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_steps/esign_step.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart' as dartz;

class ESignAndEMandateStepWidget extends StatefulWidget {
  const ESignAndEMandateStepWidget({Key? key}) : super(key: key);

  @override
  State<ESignAndEMandateStepWidget> createState() =>
      _ESignAndEMandateStepWidgetState();
}

class _ESignAndEMandateStepWidgetState
    extends State<ESignAndEMandateStepWidget> {
  @override
  void initState() {
    super.initState();
    var enquiryForm = BlocProvider.of<NewLoanCubit>(context).state.enquiryForm;
    var preEnquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form;
    if (enquiryForm != null &&
        preEnquiryForm != null &&
        preEnquiryForm.appLoanStatus != LoanStage.waitingForCallVerification &&
        preEnquiryForm.appLoanStatus != LoanStage.waitingForPreApproval &&
        preEnquiryForm.appLoanStatus != LoanStage.preApproved) {
      if (enquiryForm.eSignStatus == Constants.eSignStatusApproved &&
          enquiryForm.eMandateStage == Constants.eMandateStatusApproved) {
        BlocProvider.of<NewLoanActionCubit>(context)
            .completeESignAndEMandate(enquiryForm.id, preEnquiryForm.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var enquiryForm = BlocProvider.of<NewLoanCubit>(context).state.enquiryForm;

    if (enquiryForm == null) {
      return const Center(
        child: Text('No enquiry form found for this loan.'),
      );
    }

    return BlocListener<NewLoanActionCubit, NewLoanActionState>(
      listener: (ctx, state) {
        state.maybeWhen(
          success: (action, data) {
            if ((action == NewLoanAction.sendEMandateLink ||
                    action == NewLoanAction.resendEmandateLink) &&
                data != null) {
              final loanData =
                  data['loan'] as dartz.Tuple2<PreEnquiryForm, PreEnquiryForm>;
              final preEnquiry = loanData.value1;

              showSnackbar(context, 'Process completed successfully');
              BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(
                  preEnquiry.preEnquiryNumber, preEnquiry.pan!);
              BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(
                  preEnquiry.preEnquiryNumber, preEnquiry.pan!);
            } else if (action == NewLoanAction.completeESignAndEMandate &&
                data != null) {
              var loanData = data['loan'] as PreEnquiryForm;
              BlocProvider.of<NewLoanCubit>(context).moveToNextStep(
                form: loanData,
              );
            }
          },
          failure: (action, f) {
            if (action == NewLoanAction.sendEMandateLink ||
                action == NewLoanAction.resendEmandateLink) {
              f.maybeWhen(orElse: () {
                showSnackbar(context, 'Uh oh. Something went wrong.');
              }, serverFailure: (code, error) {
                showSnackbar(context, error);
              });
            }
          },
          orElse: () {},
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'E-SIGN',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          const ESignStepWidget(),
          const SizedBox(height: 16),
          Text(
            'E-MANDATE',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          const EMandateStepWidget(),
        ],
      ),
    );
  }
}
