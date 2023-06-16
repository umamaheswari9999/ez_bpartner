import 'dart:convert';

import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/network/api_helper.dart';
import 'package:ez_flutter/shared/logger.dart';

abstract class QueryHelper {
  Future<String> getQuery(String key) async => await fetchPreference(key);

  Future<String> fetchPreference(String attribute) async {
    const entityName = "ADPreference";
    try {
      final api = locator.get<ApiHelper>();
      final url =
          "${Constants.baseDefaultApiUrl}/$entityName?_endRow=0&_where=attribute='$attribute'&_selectedProperties=searchKey";

      final response = await api.get(url, 'Can\'t able to fetch data.');
      final query = response.fold((l) => '', (r) => r[0]['searchKey']);
      return query;
    } catch (error, st) {
      logError(error, st, 'Can\'t able to fetch data.');
      return '';
    }
  }

  Future<List<dynamic>> fetchQueryResponse(String key,
      {Map<String, String>? placeholders, String? originalQuery}) async {
    final api = locator.get<ApiHelper>();
    final query = await getQuery(key);
    const url =
        "${Constants.baseCustomApiUrl}/${CustomWebServices.queryService}";
    final requestBody = jsonEncode(_constructRequestBody(query, placeholders));

    final post = await api.post(url, requestBody, 'Could not fetch data');
    return post.fold(
      (l) => throw Exception('could not fetch data for the query'),
      (r) => r,
    );
  }

  Map<String, Map<String, dynamic>> _constructRequestBody(String query,
      [Map<String, String>? placeholders]) {
    return {
      "data": {
        "query": query,
        if (placeholders != null) "placeholders": placeholders,
      }
    };
  }
}
