import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/model/id_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bpartner_add_cubit.freezed.dart';

@injectable
class BpartnerAddCubit extends Cubit<BPartnerAddState> {
  final LoanRepo repo;
  BpartnerAddCubit(this.repo) : super(const BPartnerAddState.initial());

  static const pageSize = 20;
  void fetchInitial(String? id, {String? query}) async {
    if (id == null) return;
    emit(const BPartnerAddState.loading());
    await _fetchData(0, pageSize, id, query, []);
  }

  void fetchMore(String id) async {
    state.maybeWhen(
      success: (records, hasReachedMax, query) {
        if (!hasReachedMax) {
          _fetchData(
              records.length, records.length + pageSize, id, query, records);
        }
      },
      orElse: () {},
    );
  }

  Future<void> _fetchData(
    int start,
    int end,
    String id,
    String? query,
    List<IdName> prevRecords,
  ) async {
    final result =
        await repo.fetchBPartnerAddress(start, end, id, query: query);

    result.fold(
      (l) => emit(BPartnerAddState.failure(l)),
      (r) {
        List<IdName> finalList = [...prevRecords, ...r];
        return emit(
          BPartnerAddState.success(
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
abstract class BPartnerAddState with _$BPartnerAddState {
  const factory BPartnerAddState.initial() = _Initial;

  const factory BPartnerAddState.loading() = _Loading;

  const factory BPartnerAddState.success({
    required List<IdName> records,
    required bool hasReachedMax,
    String? query,
  }) = _Success;

  const factory BPartnerAddState.failure(Failure failure) = _Failure;
}
