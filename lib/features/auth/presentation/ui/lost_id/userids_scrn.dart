import 'package:dartz/dartz.dart' as dartz;
import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/lost_userid/lost_userid.dart';
import 'package:ez_flutter/features/auth/presentation/widgets/team_help_widget.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserIdsScrn extends StatelessWidget {
  const UserIdsScrn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          _buildImage(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Theme.of(context).colorScheme.primary.withAlpha(60),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: BlocBuilder<LostUseridCubit, LostUserid>(
                builder: (context, state) {
                  return state.maybeWhen(
                    verifiedOTP: (usernames) {
                      if (usernames.isEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Unfortunatuly, We couldn't be able to find the User ID(s) linked to the mobile number you provided",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            VerticalSpacing.large,
                            Text(
                              'Please contact our team for assitance',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        );
                      }
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VerticalSpacing.large,
                          Text(
                            "Your User ID(s) linked to the mobile number you provided...",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 18),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: usernames.length,
                            separatorBuilder: (context, index) => VerticalSpacing.small,
                            itemBuilder: (context, index) {
                              final username = usernames[index];
                              return ListTile(
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(),
                                ),
                                onTap: () async {
                                  await Clipboard.setData(
                                    ClipboardData(text: username),
                                  ).then((value) =>showSnackbar(context, 'Copied'));
                                },
                                title: Text(username),
                                trailing: const Icon(Icons.copy),
                              );
                            },
                          ),
                          VerticalSpacing.large,
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(dartz.tuple2(true, null)), 
                            child: const Text('Log In'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(dartz.tuple2(null, true)), 
                            child: const Text('Forgot Password?'),
                          ),
                        ],
                      );
                    },
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ),
          ),
          const TeamHelpWidget()
        ],
      ),
    );
  }
}

Widget _buildImage() {
  return SafeArea(
    child: Image.asset(ImagePaths.logo,
      width: 200,
      height: 200,
    ),
  );
}
