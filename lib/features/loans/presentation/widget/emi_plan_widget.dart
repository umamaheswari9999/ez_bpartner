import 'package:ez_flutter/features/loans/domain/entity/emi_plan.dart';
import 'package:flutter/material.dart';

class EmiPlanWidget extends StatelessWidget {
  final EmiPlan plan;
  final String amount;
  const EmiPlanWidget({
    Key? key,
    required this.plan,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Colors.blueGrey.shade100,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '₹$amount',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                  ),
                  Text(
                    plan.name,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '₹ ${plan.downPayment}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Upfront',
                    style: TextStyle(color: Colors.grey.shade700),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '₹ ${plan.emiAmount} x ${plan.totalemis - plan.advemi}m',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  Text(
                    'Total Repay',
                    maxLines: 3,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  Text(
                    '(EMI x EMIs to be paid)',
                    style: Theme.of(context).textTheme.overline,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
