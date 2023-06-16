import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoanDecisionWidget extends StatelessWidget {
  const LoanDecisionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewLoanCubit, NewLoanState>(
      builder: (context, state) {
        final staticData = locator.get<AppStaticData>();
        final form = state.form!;
        final shouldDisableEdit = form.finalDecision?.isNotEmpty == true;
        late bool isRefered;
        late bool isEligible;
        late bool isRejected;
        late bool doNotHaveEnoughLimit;
        if (form.downloadBs == true && form.manualFinaldecision != null) {
          isRefered = form.manualFinaldecision == LoanEligibility.refer;
          isRejected = form.manualFinaldecision == LoanEligibility.rejected;
          isEligible = form.manualFinaldecision == LoanEligibility.eligible &&
              form.manualRegularlimit != null &&
              form.loanAmount != null &&
              form.manualRegularlimit! >= form.loanAmount!;
          doNotHaveEnoughLimit =
              (form.manualFinaldecision == LoanEligibility.eligible &&
                  form.manualRegularlimit! < form.loanAmount!);
        } else {
          isRefered = form.cibilDecision == LoanEligibility.refer;
          isRejected = form.cibilDecision == LoanEligibility.rejected;
          isEligible = form.cibilDecision == LoanEligibility.eligible &&
              form.cibilLimit != null &&
              form.loanAmount != null &&
              form.cibilLimit! >= form.loanAmount!;
          doNotHaveEnoughLimit =
              (form.cibilDecision == LoanEligibility.eligible &&
                  form.cibilLimit! < form.loanAmount!);
        }

        if (shouldDisableEdit && isEligible) {
          return Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: const ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.all(2.0),
              leading: Icon(Icons.verified, color: Colors.green),
              title: Text(
                'Congratulations!!!! This loan has been pre approved',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        return Card(
          margin: const EdgeInsets.only(top: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade400),
          ),
          child: Padding(
            padding: isRejected ? EdgeInsets.zero : const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (isRefered) ...[
                  Row(
                    children: [
                      Image.asset(ImagePaths.waiting,height: 32, width: 32),
                      Expanded(
                        child: Text(
                          'Waiting for approval from the Ezfinanz Team',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  Text('Please contact operations team at',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ] else if (isRejected) ...[
                  Row(
                    children: [
                      Image.asset(ImagePaths.rejected,height: 32, width: 32),
                      const Text(
                        'We are unable to service this loan request...!\nPlease contact operations team at',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ] else if (doNotHaveEnoughLimit) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon( Icons.warning_amber,color: Colors.orange,),
                      Flexible(
                        child: Text(
                          'Your eligible amount is less than Loan Amount',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  const SizedBox()
                ],
                if (isRefered || isRejected) ...[
                  const Divider(),
                  InkWell(
                    onTap: () async => await connectToCustomerCare(staticData.contactUsNumber),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.phone, color: Colors.blue),
                        Text(staticData.contactUsNumber),
                      ],
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () async => await launchEmailTo(staticData.contactUsNumber),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.mail, color: Colors.blue),
                        Text(staticData.contactUsEmail),
                      ],
                    ),
                  ),
                ] 
              ],
            ),
          ),
        );
      },
    );
  }
}
