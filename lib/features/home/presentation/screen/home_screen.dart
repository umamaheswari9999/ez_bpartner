import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/home/presentation/bloc/status_count/status_count_cubit.dart';
import 'package:ez_flutter/features/home/presentation/widget/status_gridview.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_filters.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_status.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner_add/bpartner_add_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/loans/loans_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/bpadd_selection.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/bpartner_selection.dart';
import 'package:ez_flutter/shared/model/id_name.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IdName? _address;
  IdName? _bpAgent;
  final user = locator.get<User>();
  late LoanFilters _filters;
  @override
  void initState() {
    super.initState();
    final stateFilters = BlocProvider.of<LoansCubit>(context).state.filter;
    if (user.businessPartnerId != null) {
      _bpAgent = IdName(
        id: user.businessPartnerId!,
        name: user.businessPartnerName!,
      );
    }
    if (stateFilters.bpAddressId == null) {
      if (user.businessPartnerAddressId != null) {
        _address = IdName(
          id: user.businessPartnerAddressId!,
          name: user.businessPartnerAddressName!,
        );
      }
    } else {
      _address = stateFilters.bpAddressId;
    }
    BlocProvider.of<LoansCubit>(context).updateFilters(bpId: _bpAgent, bpAddressId: _address);

    _filters = BlocProvider.of<LoansCubit>(context).state.filter;
    BlocProvider.of<LoansCubit>(context).fetchInitial(
      _filters.copyWith(status: LoanStatus.all),
    );
    BlocProvider.of<StatusCountCubit>(context).fetchStatusCount(_filters);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (user.businessPartnerId == null) ...[
            Container(
              color: Colors.white,
              child: BPartnerSelection(
                inital: _filters.bpId?.name,
                onBPSelection: (bpagent) {
                  setState(() {
                    _bpAgent = bpagent;
                    _filters = _filters.copyWith(bpId: bpagent);
                    _address = null;
                  });
                  BlocProvider.of<StatusCountCubit>(context).resetCount();
                  BlocProvider.of<BpartnerAddCubit>(context).fetchInitial(bpagent.id);
                },
              ),
            ),
          ],
          Container(
            color: Colors.white,
            child: BPAddressSelection(
              bpartnerId: _bpAgent?.id,
              initalAddress: _address?.name,
              isEnabled: user.isManager || user.businessPartnerId == null,
              onBPAddSelection: (bpAddress) {
                setState(() {
                  _address = bpAddress;
                  _filters = _filters.copyWith(bpAddressId: bpAddress);

                  BlocProvider.of<StatusCountCubit>(context).fetchStatusCount(_filters.copyWith(
                    bpAddressId: bpAddress,
                    bpId: _bpAgent,
                  ));
                });
                BlocProvider.of<LoansCubit>(context).updateFilters(bpAddressId: bpAddress,bpId: _bpAgent);
                BlocProvider.of<LoansCubit>(context).fetchInitial(
                  _filters.copyWith(status: LoanStatus.all),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(bottom: 4),
            child: InkWell(
              onTap: () {
                showDateRangePicker(
                  context: context,
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 365 * 2)),
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
                    BlocProvider.of<StatusCountCubit>(context)
                        .fetchStatusCount(_filters);
                  }
                  BlocProvider.of<LoansCubit>(context).updateFilters(
                      fromDate: value?.start, toDate: value?.end);
                  BlocProvider.of<LoansCubit>(context).fetchInitial(
                    _filters.copyWith(status: LoanStatus.all),
                  );
                });
              },
              child: Container(
                width: double.infinity,
                height: 55,
                // color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
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
          ),
          // VerticalSpacing.medium,
          const StatusGridView(),
        ],
      ),
    );
  }
}
