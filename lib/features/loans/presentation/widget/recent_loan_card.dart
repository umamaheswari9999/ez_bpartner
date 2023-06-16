import 'package:ez_flutter/features/loans/domain/entity/loan.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/circular_percent_indicator.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/screen_utils.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/currency_formatter_utils.dart';
import 'package:ez_flutter/utils/string_utils.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentLoanCard extends StatelessWidget {
  const RecentLoanCard({
    Key? key,
    required this.loan,
  }) : super(key: key);

  final Loan loan;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (loan.isPreApproved || loan.isInDraft) {
          openLoanStepDecider(context, loan.loanNo, loan.proofTypeNumber ?? '');
        }
      },
      child: SizedBox(
        width: 350,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(12.0),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        '#${loan.loanNo}'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.blueGrey),
                      ),
                    ),
                    if (loan.isInDraft ||
                        (loan.isPreApproved && !loan.isDisbursed))
                      InkWell(
                        child: Icon(FeatherIcons.helpCircle,
                            size: 20,
                            color: Theme.of(context).colorScheme.secondary),
                        onTap: () =>
                            openChatScreen(context, loan.id, loan.loanNo),
                      ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Text(
                      loan.customerName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      loan.proofTypeNumber?.isNotEmpty == true
                          ? StringUtils.getMaskedAadhaar(loan.proofTypeNumber!)
                          : '',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(CurrencyFormatter.getFormattedAmount(loan.loanAmount)),
                    const SizedBox(width: 12),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Text(DateFormat.MMMd().format(DateTime.parse(loan.createdAt))),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      LoanStage.mapStage(loan.appLoanStatus ?? ''),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                    const Spacer(),
                    if (loan.isInDraft || loan.isPreApproved) ...[
                      CircularPercentIndicator(
                        radius: 18,
                        lineWidth: 3.0,
                        percent: (_getLoanProgressPercentage(loan.appLoanStatus ?? '', loan.isDisbursed)) + 0.3,
                        center: Text(
                          '${(_getLoanProgressPercentage(loan.appLoanStatus ?? '', loan.isDisbursed) * 10).toInt()}/7',
                          style: const TextStyle(color: Color(0xFF535355)),
                          maxLines: 1,
                        ),
                        linearGradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: <Color>[Color(0xFF1AB600), Color(0xFF6DD400)],
                        ),
                        rotateLinearGradient: true,
                        circularStrokeCap: CircularStrokeCap.round,
                      )
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }

  double _getLoanProgressPercentage(String status, bool isDisbursed) {
    if (isDisbursed) return 0.7;

    switch (status) {
      case LoanStage.draft:
        return 0.1;
      case LoanStage.reviewKyc:
        return 0.2;
      case LoanStage.waitingForKyc:
        return 0.2;
      case LoanStage.additionalInfo:
        return 0.3;
      case LoanStage.loanRequirements:
        return 0.4;
      case LoanStage.bankDetails:
        return 0.5;
      case LoanStage.initiateESign:
      case LoanStage.initialEMandate:
      case LoanStage.waitingForEMandate:
      case LoanStage.waitingForESign:
        return 0.6;
      case LoanStage.preApproved:
        return 0.5;
      case LoanStage.waitingForDisbursement:
      case LoanStage.waitingForCallVerification:
      case LoanStage.disbursed:
        return 0.7;
      default:
        return 0.1;
    }
  }
}
