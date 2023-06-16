import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_flutter/shared/model/id_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'bpartner_cubit.freezed.dart';

@injectable
class BpartnerCubit extends Cubit<BPartnerState> {
  final LoanRepo repo;
  BpartnerCubit(this.repo) : super(const BPartnerState.initial());

  static const pageSize = 20;
  void fetchInitial({String? query}) async {
    emit(const BPartnerState.loading());
    await _fetchData(0, pageSize, query, []);
  }

  void fetchMore() async {
    state.maybeWhen(
      success: (records, hasReachedMax, query) {
        if (!hasReachedMax) {
          _fetchData(records.length, records.length + pageSize, query, records);
        }
      },
      orElse: () {},
    );
  }

  Future<void> _fetchData(
    int start,
    int end,
    String? query,
    List<IdName> prevRecords,
  ) async {
    final result = await repo.fetchBPartners(start, end, query: query);

    result.fold(
      (l) => emit(BPartnerState.failure(l)),
      (r) {
        List<IdName> finalList = [...prevRecords, ...r];
        return emit(
          BPartnerState.success(
            records: finalList,
            hasReachedMax: finalList.length < pageSize,
            query: query,
          ),
        );
      },
    );
  }
}

@freezed
abstract class BPartnerState with _$BPartnerState {
  const factory BPartnerState.initial() = _Initial;

  const factory BPartnerState.loading() = _Loading;

  const factory BPartnerState.success({
    required List<IdName> records,
    required bool hasReachedMax,
    String? query,
  }) = _Success;

  const factory BPartnerState.failure(Failure failure) = _Failure;
}
