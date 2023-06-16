import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        elevation: 16.0,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(16.0),
      ),
    );
}

Future<dynamic> showErrorDialog(
  BuildContext context,
  String message, {
  List<Widget>? actions,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => AlertDialog(
      title: CircleAvatar(
        radius: 24,
        backgroundColor: Theme.of(context).colorScheme.error,
        child: const Icon(Icons.warning_amber_rounded),
      ),
      content: Text(
        message,
        style:
            Theme.of(context).textTheme.headline6?.copyWith(color: Colors.red),
        textAlign: TextAlign.center,
      ),
      actions: [
        if (actions != null) ...actions,
        PrimaryButton(
            text: 'OKAY', onPressed: () => Navigator.of(context).pop()),
      ],
    ),
  );
}

Future showLoanRejectionDialog(
    BuildContext context, String phoneNumber, String email) {
  return showDialog(
    context: context,
    useSafeArea: true,
    builder: (ctx2) => AlertDialog(
      contentPadding:
          const EdgeInsets.only(top: 18, left: 24, right: 24, bottom: 16),
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      actionsPadding:
          const EdgeInsets.only(top: 0, bottom: 4, left: 8, right: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          Image.asset(ImagePaths.rejected, height: 32, width: 32),
          const SizedBox(width: 6),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We are unable to service this loan request',
                  maxLines: null,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.red, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Flexible(
              child: Card(
                child: ListTile(
                  onTap: () async => connectToCustomerCare(phoneNumber),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text('Contact us'),
                ),
              ),
            ),
            Flexible(
              child: Card(
                child: ListTile(
                  // onTap: () async => launchEmailTo(email),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text('Email'),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
