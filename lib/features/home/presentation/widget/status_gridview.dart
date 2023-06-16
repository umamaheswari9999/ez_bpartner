import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/home/presentation/bloc/status_count/status_count_cubit.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_status.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/loans/loans_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/screen/loans_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusGridView extends StatelessWidget {
  const StatusGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatusCountCubit, StatusCountState>(
      builder: (context, state) {
        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.7,
          padding: const EdgeInsets.all(4),
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          children: [
            _buildCardItem(
              context,
              icon: const Icon(
                Icons.pending_actions_outlined,
                color: Colors.blue,
                size: 36,
              ),
              status: 'Draft',
              value: getValue(state, 'Draft'),
            ),
            _buildCardItem(
              context,
              icon: const Icon(
                Icons.check_box_outlined,
                color: Colors.amber,
                size: 36,
              ),
              status: 'Pre-approved',
              value: getValue(state, 'Pre-approved'),
            ),
            _buildCardItem(
              context,
              icon: const Icon(
                Icons.cancel_outlined,
                color: Colors.red,
                size: 36,
              ),
              status: 'Rejected',
              value: getValue(state, 'Rejected'),
            ),
            _buildCardItem(
              context,
              icon: const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 36,
              ),
              status: 'Disbursed',
              value: getValue(state, 'Disbursed'),
            ),
          ],
        );
      },
    );
  }

  String getValue(StatusCountState state, String key) {
    return state.maybeWhen(
      orElse: () => 0.toString(),
      success: (status) => status.where((e) => e.status == key).first.count,
    );
  }

  Widget _buildCardItem(
    BuildContext context, {
    required Icon icon,
    required String status,
    required String value,
  }) {
    return InkWell(
      onTap: () => _openLoans(context, getStatus(status)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    status.replaceAll("-", '').toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  LoanStatus getStatus(String key) {
    if (key == 'Pre-approved') {
      return LoanStatus.preApproved;
    } else if (key == 'Rejected') {
      return LoanStatus.rejected;
    } else if (key == 'Disbursed') {
      return LoanStatus.disbursed;
    }
    return LoanStatus.draft;
  }

  void _openLoans(BuildContext context, LoanStatus status) {
    final filters = BlocProvider.of<LoansCubit>(context).state.filter;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (ctx2) => locator.get<LoansCubit>(),
              ),
            ],
            child: LoansScreen(
              defaultFilters: filters.copyWith(status: status),
            ),
          );
        },
      ),
    );
  }
}
