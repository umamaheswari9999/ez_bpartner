import 'package:ez_flutter/features/home/presentation/widget/loan_search_bar.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_filters.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_status.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/widget/recent_loan_card.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:ez_flutter/shared/widget/empty_list_widget.dart';
import 'package:ez_flutter/shared/widget/failure_widget.dart';
import 'package:ez_flutter/shared/widget/go_back.dart';
import 'package:ez_flutter/shared/widget/loading_list_widget.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class LoansScreen extends StatefulWidget {
  const LoansScreen({
    Key? key,
    this.defaultFilters,
  }) : super(key: key);

  final LoanFilters? defaultFilters;

  @override
  State<LoansScreen> createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  late LoanFilters _filters;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    if (widget.defaultFilters != null) {
      BlocProvider.of<LoansCubit>(context).setFilters(widget.defaultFilters!);
    }
    _filters = BlocProvider.of<LoansCubit>(context).state.filter;
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    BlocProvider.of<LoansCubit>(context).fetchMore(_filters);
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      BlocProvider.of<LoansCubit>(context).fetchMore(_filters);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Browse Loans',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        leading: const GoBack(),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoanSearchBar(
                displayFilters: false,
                enabled: true,
                autoFocus: false,
                onSearch: (query) {
                  setState(() {
                    _filters = _filters.copyWith(searchQuery: query);
                    _fetchLoans(context);
                  });
                },
                onCancel: () {
                  setState(() {
                    _filters = _filters.copyWith(searchQuery: null);
                    _fetchLoans(context);
                  });
                },
              ),
              VerticalSpacing.small,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<LoanStatus>(
                              value: _filters.status,
                              style: Theme.of(context).textTheme.bodyLarge,
                              borderRadius: BorderRadius.circular(8.0),
                              items: const [
                                DropdownMenuItem(
                                  value: LoanStatus.all,
                                  child: Text('All'),
                                ),
                                DropdownMenuItem(
                                  value: LoanStatus.draft,
                                  child: Text('Draft'),
                                ),
                                DropdownMenuItem(
                                  value: LoanStatus.preApproved,
                                  child: Text('Pre Approved'),
                                ),
                                DropdownMenuItem(
                                  value: LoanStatus.disbursed,
                                  child: Text('Disbursed'),
                                ),
                                DropdownMenuItem(
                                  value: LoanStatus.rejected,
                                  child: Text('Rejected'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _filters = _filters.copyWith(status: value);
                                  _fetchLoans(context);
                                });
                              },
                              hint: const Text('status'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        width: 175,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () {
                            showDateRangePicker(
                                context: context,
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 365 * 2)),
                                lastDate: DateTime.now(),
                                initialDateRange: DateTimeRange(
                                  start: _filters.fromDate!,
                                  end: _filters.toDate!,
                                )).then((value) {
                              if (value != null) {
                                setState(() {
                                  _filters = _filters.copyWith(
                                    fromDate: value.start,
                                    toDate: value.end,
                                  );
                                  _fetchLoans(context);
                                });
                              }
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  '${DateFormat("d MMM yy").format(_filters.fromDate!)} - ${DateFormat("d MMM yy").format(_filters.toDate!)}'),
                              const Spacer(),
                              const Icon(FeatherIcons.calendar, size: 16)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        elevation: 1,
      ),
      body: BlocBuilder<LoansCubit, LoansState>(
        builder: (ctx, state) {
          if (state.isloading) {
            return const LoadingListWidget();
          }
          if (state.failure != null) {
            return Center(
              child: FailureWidget(
                failure: state.failure!,
                onRefresh: () => _fetchLoans(context),
              ),
            );
          }
          if (_filters.status == LoanStatus.disbursed) {
            return _buildList(state.disbursed, state.hasReachedMax);
          } else if (_filters.status == LoanStatus.preApproved) {
            return _buildList(state.preapproved, state.hasReachedMax);
          } else if (_filters.status == LoanStatus.rejected) {
            return _buildList(state.rejected, state.hasReachedMax);
          } else if (_filters.status == LoanStatus.draft) {
            return _buildList(state.draft, state.hasReachedMax);
          } else {
            return _buildList(state.allLoans, state.hasReachedMax);
          }
        },
      ),
    );
  }

  void _fetchLoans(BuildContext context) {
    if(_filters.status == LoanStatus.all) {
      BlocProvider.of<LoansCubit>(context).fetchInitialAllLoans(_filters);
    } else {
      BlocProvider.of<LoansCubit>(context).fetchInitial(_filters);
    }
  }

  Widget _buildList(List<Loan> loans, bool hasReachedMax) {
    if (loans.isEmpty) {
      return Center(
        child: EmptyListWidget(
          message: 'No loans found with that query. Try changing some filters',
          onRefresh: () => _fetchLoans(context),
        ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      itemCount: loans.length + (hasReachedMax ? 0 : 1),
      padding: const EdgeInsets.all(4),
      separatorBuilder: (ctx, idx) => const SizedBox(height: 6),
      itemBuilder: (ctx, idx) {
        if (idx >= loans.length) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 48.0,
                    height: 48.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 8.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Container(
                          width: double.infinity,
                          height: 8.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Container(
                          width: 40.0,
                          height: 8.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }

        return RecentLoanCard(loan: loans[idx]);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
