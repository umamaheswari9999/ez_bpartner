import 'dart:io';

import 'package:ez_flutter/features/reports/data/reports_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'download_reports.freezed.dart';

enum DownloadAction{bankstatement,disbursement}

@injectable
class DownloadReportCubit extends Cubit<DownloadReportState> {
  final ResportsRepo repo;
  DownloadReportCubit(this.repo) : super(const DownloadReportState.initial());

  void downloadBankStatement(String from,String to) async {
    const action = DownloadAction.bankstatement;
    emit(const DownloadReportState.loading(action));
    try {
      final res = await repo.downloadBPStatementReport(from,to);
      res.fold(
        (l) => emit(DownloadReportState.failure(action,l)),
        (r) => emit(DownloadReportState.success(action,r)),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] cant able to download report');
    }
  }

    void downloadDisbursementReport(String from,String to) async {
    const action = DownloadAction.disbursement;
    emit(const DownloadReportState.loading(action));
    try {
      final res = await repo.downloadDisbursementReport(from,to);
      res.fold(
        (l) => emit(DownloadReportState.failure(action,l)),
        (r) => emit(DownloadReportState.success(action,r)),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] cant able to download report');
    }
  }
}

@freezed
abstract class DownloadReportState with _$DownloadReportState {
  const factory DownloadReportState.initial() = _Initial;

  const factory DownloadReportState.loading(DownloadAction action) = _Loading;

  const factory DownloadReportState.success(DownloadAction action,String text) = _Success;

  const factory DownloadReportState.failure(DownloadAction action,Failure failure) = _Failure;
}
