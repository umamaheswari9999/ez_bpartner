import 'package:ez_flutter/features/loans/domain/entity/loan.dart';
import 'package:ez_flutter/features/loans/presentation/widget/recent_loan_card.dart';
import 'package:flutter/material.dart';

class RecentLoansWidget extends StatelessWidget {
  const RecentLoansWidget({
    Key? key,
    required this.loans,
    required this.title,
    required this.onMore,
  }) : super(key: key);

  final String title;
  final List<Loan> loans;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: onMore,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    'View All'.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 6),
          if (loans.isNotEmpty)
            Expanded(
              child: ListView.separated(
                itemCount: loans.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 4.0, right: 16.0),
                separatorBuilder: (ctx, idx) => const SizedBox(width: 12),
                itemBuilder: (ctx, idx) => RecentLoanCard(loan: loans[idx]),
              ),
            ),
          if (loans.isEmpty)
            const Expanded(child: Center(child: Text('No Loans found'))),
        ],
      ),
    );
  }
}
