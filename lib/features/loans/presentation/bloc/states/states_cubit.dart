import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/model/simple.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'states_cubit.freezed.dart';

@injectable
class StatesCubit extends Cubit<StatesState> {
  final LoanRepo repo;

  StatesCubit(this.repo)
      : super(const StatesState.initial());

  void fetchStates() async {
    emit(const StatesState.loading());
    try {
      final result = await repo.fetchStates(Constants.indiaCountryCode);
      emit(
        result.fold(
              (l) => StatesState.failure(l),
              (r) => StatesState.success(r),
        ),
      );
    } catch (e, st) {
      emit(
        StatesState.failure(
          Failure.unknownFailure(),
        ),
      );
    }
  }
}

@freezed
abstract class StatesState with _$StatesState {
  const factory StatesState.initial() = _StatesInitial;

  const factory StatesState.loading() = _StatesLoading;

  const factory StatesState.success(List<Simple> records) =
  _StatesSuccess;

  const factory StatesState.failure(Failure failure) = _StatesFailure;
}