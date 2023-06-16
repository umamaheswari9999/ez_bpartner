import 'package:ez_flutter/network/api_helper.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';

@injectable
class AppVersionUseCase {
  final ApiHelper api;

  AppVersionUseCase(this.api);

  Future<bool> isUpdateAvailable() async {
    const defErrMsg = 'Could not check for update';
    try {
      final prefKey = Platform.isAndroid
          ? Constants.prefAndroidAppVersion
          : Constants.prefIOSAppVersion;
      final url = "${Constants.baseDefaultApiUrl}/${Entities.preference}?"
          "_where=attribute='$prefKey'&_selectedProperties=searchKey";

      final result = await api.get(url, defErrMsg);
      return await result.fold(
        (l) => false,
        (r) async {
          final packageInfo = await PackageInfo.fromPlatform();
          final appVersion = packageInfo.version;
          if (r.isNotEmpty) {
            final appVersionFromServer = r[0]['searchKey'].toString().trim();
            return appVersion != appVersionFromServer;
          }
          return false;
        },
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
      return false;
    }
  }
}
