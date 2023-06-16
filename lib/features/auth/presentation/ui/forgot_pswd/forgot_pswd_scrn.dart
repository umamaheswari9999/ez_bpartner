import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/ctxt_utils/overlay.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/forgot_pswd/forgot_pswd.dart';
import 'package:ez_flutter/features/auth/presentation/ui/forgot_pswd/widgets/enter_userid_widget.dart';
import 'package:ez_flutter/features/auth/presentation/ui/forgot_pswd/widgets/fpswd_otp_widget.dart';
import 'package:ez_flutter/features/auth/presentation/ui/forgot_pswd/widgets/invalid_user_widget.dart';
import 'package:ez_flutter/features/auth/presentation/ui/forgot_pswd/widgets/reset_pswd_widget.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPswdScrn extends StatefulWidget {
  const ForgotPswdScrn({Key? key}) : super(key: key);

  @override
  State<ForgotPswdScrn> createState() => _ForgotPswdScrnState();
}

class _ForgotPswdScrnState extends State<ForgotPswdScrn> {
  late LoadingOverlay _overlay;
  @override
  void initState() {
    super.initState();
    _overlay = LoadingOverlay.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: BlocListener<ForgotPswdCubit, ForgotPswd>(
        listener: (context, state) {
          if (state.isloading == true) {
            _overlay.show();
          }
          if (state.hideOverlay == true) {
            _overlay.hide();
          }
          if (state.isSuccess == true) {
            Navigator.of(context).pop();
          }
          if (state.failure != null) {
            state.failure!.maybeWhen(
              invalidFieldValue: (message) =>
                  showSnackbar(context, message ?? ''),
              unAuthorized: () =>
                  showSnackbar(context, 'OTP that you entered is Invalid'),
              serverFailure: (code, message) => showSnackbar(context, message),
              apiFailure: (message) => showErrorDialog(context, message),
              orElse: () => showSnackbar(
                  context, 'Something went wrong..! Please try again.'),
            );
          }
        },
        child: Column(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<ForgotPswdCubit, ForgotPswd>(
                      builder: (context, state) {
                        if ((state.isValidUser == false || state.isOTPSent == false) && state.isOTPVerified == null) {
                          return const InvalidUserWidget();
                        } else if (state.isValidUser == true && state.isOTPSent == true && state.isOTPVerified == null) {
                          return const FPswdOTPWidget();
                        } else if (state.isOTPVerified == true) {
                          return const ResetPSWDWidget();
                        }
                        return const EnterUserIdWidget();
                      },
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Log in'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Lost User ID'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
