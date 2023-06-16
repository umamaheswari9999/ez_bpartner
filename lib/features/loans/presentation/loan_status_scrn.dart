import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/home/presentation/bloc/status_count/status_count_cubit.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_filters.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_status.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/screen/recent_loans_screen.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/bpadd_selection.dart';
import 'package:ez_flutter/shared/model/id_name.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LoanStatusScreen extends StatefulWidget {
  const LoanStatusScreen({Key? key}) : super(key: key);

  @override
  State<LoanStatusScreen> createState() => _LoanStatusScreenState();
}

class _LoanStatusScreenState extends State<LoanStatusScreen> {
  late User user;
  IdName? _address;
  late LoanFilters _filters;
  @override
  void initState() {
    super.initState();
    _filters = BlocProvider.of<LoansCubit>(context).state.filter;
    user = locator.get<User>();
    if (_filters.bpAddressId != null) {
      _address = _filters.bpAddressId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: RefreshIndicator(
        onRefresh: () {
          // BlocProvider.of<RecentLoansCubit>(context).fetchRecentLoans(

          // );
          return Future.delayed(const Duration(seconds: 2));
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 64),
          child: Column(
            children: [
              if (user.isManager) ...[
                BPAddressSelection(
                  initalAddress: _address?.name,
                  bpartnerId: user.businessPartnerId,
                  onBPAddSelection: (bpAdd) {
                    setState(() {
                      _address = bpAdd;
                      _filters = _filters.copyWith(bpAddressId: bpAdd);
                    });
                    BlocProvider.of<LoansCubit>(context).setFilters(_filters);
                    BlocProvider.of<RecentLoansCubit>(context).fetchRecentLoans(
                      _filters.copyWith(status: LoanStatus.all)
                    );
                  },
                ),
              ],
             const SizedBox(height: 12,),
              InkWell(
                onTap: () {
                  showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now().subtract(const Duration(days: 365 * 2)),
                    lastDate: DateTime.now(),
                    initialDateRange: DateTimeRange(
                      start: _filters.fromDate!,
                      end: _filters.toDate!,
                    ),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _filters = _filters.copyWith(
                          fromDate: value.start,
                          toDate: value.end,
                        );
                      });
                      BlocProvider.of<StatusCountCubit>(context).fetchStatusCount(_filters);
                      BlocProvider.of<LoansCubit>(context).fetchInitial(_filters);
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '${DateFormat("dd-MM-yyyy").format(_filters.fromDate!)} - ${DateFormat("dd-MM-yyyy").format(_filters.toDate!)}'),
                      const Icon(FeatherIcons.calendar)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Container(
                color: const Color(0xffeceff5),
                child: const RecentLoansScreen(),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: (Colors.white),
    );
  }
}
