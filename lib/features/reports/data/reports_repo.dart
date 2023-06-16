import 'dart:convert';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/network/api_helper.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/locator.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@lazySingleton
class ResportsRepo {
  final ApiHelper api;

  ResportsRepo(this.api);
  Future<Either<Failure, String>> downloadBPStatementReport(String from, String to) async {
    const defErrMsg = "Cant able to download Statement Report.";
    try {
      final reqBody = jsonEncode(
        ({
          "data": {
            "returnType": "both",
            "reportType": "pdf",
            "orgId": "177D7D9FA9994A80B92C70D9734BB68B",
            "acctSchemaId": "25B765DF81E94954B7AFBDF76AB23022",
            "bpartnerId": getLoggedInUser().businessPartnerId,
            "DateFrom": from,
            "DateTo": to,
            "userid": getLoggedInUser().id,
            "Sendmail":"yes",
          }
        }),
      );

      const url =
          '${Constants.baseCustomApiUrl}/com.easycloud.statements.statements';
      final response = await api.loanApiPost(url, reqBody, defErrMsg, isCustomLoanApi: true);
      return response.fold(
        (l) => left(l),
        (r) => right('BP Statement Report - ${r['text']}'),
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  Future<Either<Failure, String>> downloadDisbursementReport(String from, String to) async {
    const defErrMsg = "Cant able to download Statement Report.";
    try {
      final reqBody = jsonEncode(
        ({
          "data": {
            "DateFrom": from,
            "DateTo": to,
            "bpartnerId": getLoggedInUser().businessPartnerId,
            "bpgroupId": "150916ED18AF477AA3E4D5EE76E576F7",
            "outputType": "pdf",
            "userid": getLoggedInUser().id,
            "Sendmail":"yes",
          }
        }),
      );
      const url =
          '${Constants.baseCustomApiUrl}/com.saksham.loandetails.Disbursement';

      final response = await api.loanApiPost(url, reqBody, defErrMsg);
      return response.fold(
        (l) => left(l),
        (r) => right('Disburment Report - ${r['text']}'),
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.apiFailure(defErrMsg));
  }
}
