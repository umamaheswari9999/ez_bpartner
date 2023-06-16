import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreApprovalStepWidget extends StatelessWidget {
  const PreApprovalStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewLoanCubit, NewLoanState>(
      builder: (ctx, state) {
        var form = state.form!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (form.appLoanStatus == LoanStage.waitingForPreApproval)
              ListTileTheme(
                child: ListTile(
                  tileColor: AppColors.lightGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: const Icon(FeatherIcons.watch),
                  title:
                      const Text('Waiting for Pre Approval from Ezfinanz Team'),
                  subtitle: Column(
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                              child: _buildValueWidget(context,
                                  form.loanAmount!.toString(), 'AMOUNT')),
                          Expanded(
                              child: _buildValueWidget(
                                  context, form.emiAmount.toString(), 'EMI')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            if (form.appLoanStatus == LoanStage.waitingForCallVerification ||
                form.appLoanStatus == LoanStage.waitingForDisbursement)
              ListTileTheme(
                child: ListTile(
                  tileColor: AppColors.lightGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: Icon(
                    form.isDisbursed
                        ? Icons.verified_rounded
                        : FeatherIcons.watch,
                    color: form.isDisbursed ? Colors.green : Colors.grey,
                  ),
                  title: Text(
                    form.appLoanStatus == LoanStage.waitingForCallVerification
                        ? 'Waiting for Call Verification'
                        : form.isDisbursed
                            ? 'This loan has been disbursed'
                            : 'Waiting for Disbursement',
                  ),
                  subtitle: Column(
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                              child: _buildValueWidget(context,
                                  form.loanAmount!.toString(), 'AMOUNT')),
                          Expanded(
                              child: _buildValueWidget(
                                  context, form.emiAmount.toString(), 'EMI')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            if (form.appLoanStatus == LoanStage.preApproved)
              ListTile(
                tileColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                contentPadding: const EdgeInsets.all(16.0),
                leading: const CircleAvatar(
                  child: Icon(FeatherIcons.checkCircle),
                ),
                title: const Text(
                    'Congratulations!!!. Your loan has been pre approved by Ezfinanz team.'),
              ),
          ],
        );
      },
    );
  }

  Widget _buildValueWidget(
      BuildContext context, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(double.parse(title).toStringAsFixed(0).toString(),
            style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 2),
        Text(subtitle, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
