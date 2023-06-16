import 'package:ez_flutter/constants/constants.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher.dart' as ul;

Future<void> launchUrl(String url) async {
  if (await ul.canLaunchUrl(Uri.parse(url))) {
    ul.launch(url, forceWebView: true, enableJavaScript: true);
  }
}

Future<void> launchUrlExternal(String url) async {
  if (await ul.canLaunch(url)) {
    ul.launch(url);
  }
}
Future<void> connectToCustomerCare(String mobileNumber) async {
  if (await ul.canLaunchUrl(Uri.parse("tel:$mobileNumber"))) {
    await ul.launchUrl(Uri.parse("tel:$mobileNumber"));
  }
}

Future<void> launchEmailTo(String emailAdd) async {
  final emailLaunchUri = Uri(
    scheme: 'mailto',
    path: emailAdd,
  );
  await ul.launchUrl(emailLaunchUri);
}

void launchFAQsUrl() => launchUrl(Constants.bpFAQsUrl);

void launchAppStore(int appId) async => await StoreRedirect.redirect(iOSAppId: appId.toString());

void launchPlayStore(String appId) async {
  var url = "https://play.google.com/store/apps/details?id=$appId&hl=en";
  if (await ul.canLaunch(url)) {
    await ul.launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void openAppInStore() async {
  var packageInfo = await PackageInfo.fromPlatform();
  if (Platform.isAndroid) {
    launchPlayStore(packageInfo.packageName);
  } else if (Platform.isIOS) {
    launchAppStore(Constants.iosAppId);
  }
}
