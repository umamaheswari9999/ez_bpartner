import 'package:connectivity_plus/connectivity_plus.dart';

/// Checks for active internet connection
Future<bool> hasInternet() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
