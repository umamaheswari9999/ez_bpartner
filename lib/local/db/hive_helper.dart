import 'dart:convert';

import 'package:ez_flutter/local/db/hive_constants.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveHelper {
  HiveHelper._();

  static bool isSubscribedForPushNotifications() =>
      Hive.box(HiveConstants.appBox).get(HiveConstants.subscribedForNotifications) ?? false;

  static void markAsSubscribed() => Hive.box(HiveConstants.appBox).put(HiveConstants.subscribedForNotifications, true);

  static void markAsUnSubscribed() =>
      Hive.box(HiveConstants.appBox).put(HiveConstants.subscribedForNotifications, false);

  static String getTandCUrl() => Hive.box(HiveConstants.appBox).get(HiveConstants.termsAndConditionsUrl) as String;

  static String getFaqUrl() => Hive.box(HiveConstants.appBox).get(HiveConstants.faqUrl) as String;

  static void storeTermsAndConditionsUrl(String url) =>
      Hive.box(HiveConstants.appBox).put(HiveConstants.termsAndConditionsUrl, url);

  static void storeFaqUrl(String url) => Hive.box(HiveConstants.appBox).put(HiveConstants.faqUrl, url);

  static void storeAppStaticData(String data) => Hive.box(HiveConstants.appBox).put(HiveConstants.appStaticData, data);

  static AppStaticData? getAppStaticData() {
    try {
      final data = Hive.box(HiveConstants.appBox).get(HiveConstants.appStaticData);
      if (data == null) return null;

      return AppStaticData.fromJson(json.decode(data));
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }
}
