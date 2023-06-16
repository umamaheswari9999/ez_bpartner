import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_status.dart';
import 'package:ez_flutter/features/loans/domain/entity/recent_loans.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/screen/loans_screen.dart';
import 'package:ez_flutter/features/loans/presentation/widget/recent_loans_loading.dart';
import 'package:ez_flutter/features/loans/presentation/widget/recent_loans_widget.dart';
import 'package:ez_flutter/shared/widget/failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentLoansScreen extends StatelessWidget {
  const RecentLoansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoansCubit, LoansState>(
        builder: (ctx, state) {
          if (state.isloading) {
            return const RecentLoansLoading();
          }
          if (state.failure != null) {
            return Center(
              child: FailureWidget(
                failure: state.failure!,
                onRefresh: () => _fetchRecentLoans(context),
              ),
            );
          }
          if (state.isSuccess) {
            final loans = RecentLoans(
              draftLoans: state.draft,
              preApprovedLoans: state.preapproved,
              disbursedLoans: state.disbursed,
              rejectedLoans: state.rejected,
            );
            return _buildList(context, loans);
          }
          return const SizedBox();
          // return state.when(
          //   initial: () => const RecentLoansLoading(),
          //   loading: () => const RecentLoansLoading(),
          //   success: (loans, hasReachedMax) => _buildList(context, loans),
          //   failure: (f) => Center(
          //     child: FailureWidget(
          //       failure: f,
          //       onRefresh: () => _fetchRecentLoans(context),
          //     ),
          //   ),
          // );
        },
    );
  }

  void _fetchRecentLoans(BuildContext context) {
    final filters = BlocProvider.of<LoansCubit>(context).state.filter.copyWith(status: LoanStatus.all);
    BlocProvider.of<LoansCubit>(context).fetchInitial(filters);
  }

  Widget _buildList(BuildContext context, RecentLoans loans) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RecentLoansWidget(
          loans: loans.draftLoans,
          title: 'RECENT DRAFT LOANS',
          onMore: () => _openLoans(context, LoanStatus.draft),
        ),
        RecentLoansWidget(
          loans: loans.preApprovedLoans
              .where((element) => element.isDisbursed == false)
              .toList(),
          title: 'RECENT PRE APPROVED LOANS',
          onMore: () => _openLoans(context, LoanStatus.preApproved),
        ),
        RecentLoansWidget(
          loans: loans.disbursedLoans,
          title: 'RECENT DISBURSED LOANS',
          onMore: () => _openLoans(context, LoanStatus.disbursed),
        ),
      ],
    );
  }

  void _openLoans(BuildContext context, LoanStatus status) {
    final filters = BlocProvider.of<LoansCubit>(context).state.filter;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) {
        return BlocProvider(
          create: (ctx2) => locator.get<LoansCubit>(),
          child: LoansScreen(
            defaultFilters: filters.copyWith(status: status),
          ),
        );
      }),
    );
  }
}
