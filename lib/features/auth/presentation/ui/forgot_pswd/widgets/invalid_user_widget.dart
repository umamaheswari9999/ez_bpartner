import 'package:ez_flutter/features/auth/presentation/bloc/forgot_pswd/forgot_pswd.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvalidUserWidget extends StatelessWidget {
  const InvalidUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPswdCubit, ForgotPswd>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            BlocProvider.of<ForgotPswdCubit>(context).emitUserIdScrn();
            return false;
          },
          child: Column(
            children: [
              VerticalSpacing.large,
              if (state.isValidUser == true && state.isOTPSent == false) ...[
                Text(
                  "User ID that you mentioned (${state.username}) is not linked with Phone Number.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ] else ...[
                Text(
                  "Sorry,unfortunately we couldn't be able to find the User ID you provided.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
              VerticalSpacing.large,
              Text(
                "Please contact out team for assitance",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              VerticalSpacing.large,
              InkWell(
                onTap: () =>
                    BlocProvider.of<ForgotPswdCubit>(context).emitUserIdScrn(),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Icon(Icons.arrow_back),
                    Text('GO BACK'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
