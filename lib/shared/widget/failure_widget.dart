import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    Key? key,
    required this.failure,
    required this.onRefresh,
    this.text = 'TRY AGAIN',
  }) : super(key: key);

  final Failure failure;
  final Function() onRefresh;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          failure.maybeWhen(
            serverFailure: (code, message) {
              return Image.asset(ImagePaths.serverMaintainence,height: 100,width: 150);
            },
            orElse: () {
              return SvgPicture.asset(ImagePaths.serverIssue,
                height: 50,
                width: 150,
                semanticsLabel: 'Something went wrong',
              );
            },
          ),
          const SizedBox(height: 16),
          failure.when(
            invalidFieldValue: (message) =>
                Text('Some fields contain illegal values. $message'),
            noInternet: () => const Text('No internet connection'),
            unAuthorized: () => const Text('Un Authorized'),
            serverFailure: (code, message) => Text(
              'Unfortunately something went wrong. Please contact support team. \n [$code] [$message]',
              textAlign: TextAlign.center,
            ),
            unknownApiFailure: () => const Text('Unknown API failure.'),
            unknownFailure: () =>
                const Text('Uh oh. something is not right. Please try again'),
            apiFailure: (message) => Text(message),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onRefresh,
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
              elevation: 0,
              shadowColor: const Color(0x7040BFFF),
            ),
            child: Text(
              text ?? 'CLICK HERE',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
