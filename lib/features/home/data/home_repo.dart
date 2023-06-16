import 'dart:io';

import 'package:ez_flutter/features/home/model/status_count.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_filters.dart';
import 'package:ez_flutter/network/api_helper.dart';
import 'package:ez_flutter/network/query_helper.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/locator.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

@lazySingleton
class HomeRepo extends QueryHelper {
  final ApiHelper api;

  HomeRepo(this.api);
  Future<Either<Failure, List<StatusCount>>> fetchCounts(
      LoanFilters filters) async {
    const defErrMsg = "Cant able to download Statement Report.";
    try {
      final addressId = filters.bpAddressId?.id;
      final fromdate = DateFormat('yyyy-MM-dd').format(filters.fromDate!);
      final todate = DateFormat('yyyy-MM-dd').format(filters.toDate!);
      final bpid = getLoggedInUser().businessPartnerId ?? filters.bpId?.id;
      final placeholders = {
        "filters":
            "Bpagent_ID='$bpid' and Agentbranch_ID='$addressId' and  date(Created) >= date('$fromdate') and date(Created)<=date('$todate')"
      };

      final res = await fetchQueryResponse(
        'BPStatusCountQuery',
        placeholders: placeholders,
      );
      return right(res.map((e) => StatusCount.fromJson(e)).toList());
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.apiFailure(defErrMsg));
  }
}
