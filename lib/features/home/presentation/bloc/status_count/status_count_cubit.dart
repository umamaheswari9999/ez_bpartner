import 'package:ez_flutter/features/home/data/home_repo.dart';
import 'package:ez_flutter/features/home/model/status_count.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_filters.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'status_count_cubit.freezed.dart';

@injectable
class StatusCountCubit extends Cubit<StatusCountState> {
  final HomeRepo repo;
  StatusCountCubit(this.repo) : super(const StatusCountState.initial());

  void fetchStatusCount(LoanFilters filters) async {
    if (filters.bpAddressId == null) {
      final failure = Failure.invalidFieldValue('Please select Agent Adress');
      emit(StatusCountState.failure(failure));
    } else if (filters.fromDate == null) {
      final failure = Failure.invalidFieldValue('Please select From Date');
      emit(StatusCountState.failure(failure));
    } else if (filters.toDate == null) {
      final failure = Failure.invalidFieldValue('Please select To Date');
      emit(StatusCountState.failure(failure));
    } else {
      emit(const StatusCountState.loading());
      try {
        final res = await repo.fetchCounts(filters);
        res.fold(
          (l) => emit(StatusCountState.failure(l)),
          (r) => emit(StatusCountState.success(r)),
        );
      } catch (e, st) {
        logError(e, st, '[bloc] cant able to fetch status count');
      }
    }
  }

  void resetCount() {
    final count = [
      StatusCount(count: '0', status: 'Draft'),
      StatusCount(count: '0', status: 'Pre-approved'),
      StatusCount(count: '0', status: 'Rejected'),
      StatusCount(count: '0', status: 'Disbursed'),
    ];
    emit(StatusCountState.success(count));
  }
}

@freezed
abstract class StatusCountState with _$StatusCountState {
  const factory StatusCountState.initial() = _Initial;

  const factory StatusCountState.loading() = _Loading;

  const factory StatusCountState.success(List<StatusCount> status) = _Success;

  const factory StatusCountState.failure(Failure failure) = _Failure;
}
