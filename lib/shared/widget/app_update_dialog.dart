import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:flutter/material.dart';

class AppUpdateDialog extends StatelessWidget {
  const AppUpdateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: const Text(
          'App Update',
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'A new version of the app is available. Please update the app to continue.',
          textAlign: TextAlign.center,
        ),
        actions: [
          OutlinedButton(
            child: Text(
              'OPEN STORE',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () async => openAppInStore(),
          ),
        ],
      ),
    );
  }
}
