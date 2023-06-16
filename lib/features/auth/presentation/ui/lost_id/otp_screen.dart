import 'package:dartz/dartz.dart' as dartz;
import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/ctxt_utils/overlay.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/lost_userid/lost_userid.dart';
import 'package:ez_flutter/features/auth/presentation/ui/lost_id/userids_scrn.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String phonenumer;
  const OTPScreen({Key? key, required this.phonenumer}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late TextEditingController _otp;
  late LoadingOverlay _overlay;
  @override
  void initState() {
    super.initState();
    _otp = TextEditingController();
    _overlay = LoadingOverlay.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: BlocListener<LostUseridCubit, LostUserid>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => _overlay.show(),
            verifiedOTP: (usernames) {
              _overlay.hide();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctxt) => BlocProvider.value(
                    value: BlocProvider.of<LostUseridCubit>(context),
                    child: const UserIdsScrn(),
                  ),
                ),
              ).then(
                (value) {
                  if(value == null) return;
                final res = value as dartz.Tuple2<bool?,bool?>;
                Navigator.of(context).pop(res);
                },
              );
            },
            failure: (failure) {
              failure.maybeWhen(
                invalidFieldValue: (message) => showSnackbar(context, message ?? ''),
                unAuthorized: () {
                  _overlay.hide();
                  showSnackbar(
                    context, 'Invalid OTP.. Please check once again');
                },
                orElse: () => _overlay.hide(),
              );
            },
            orElse: () {},
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    VerticalSpacing.large,
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Verify Your OTP !",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    VerticalSpacing.large,
                    Text(
                      'Please enter 6 digits vertification code sent to your number +91 ${widget.phonenumer}.',
                      textAlign: TextAlign.center,
                      maxLines: null,
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                        letterSpacing: 1.1,
                      ),
                    ),
                    VerticalSpacing.medium,
                    _buildOTPFields(),
                    VerticalSpacing.large,
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: () {
                          BlocProvider.of<LostUseridCubit>(context).validateOTP(widget.phonenumer, _otp.text);
                        },
                        text: 'VERIFY',
                      ),
                    ),
                    VerticalSpacing.large,
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(dartz.tuple2(null, null)), 
                      child: const Text('Log In'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(dartz.tuple2(null, true)), 
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return SafeArea(
      child: Image.asset(ImagePaths.logo,
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _buildOTPFields() {
    return Pinput(
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      autofocus: true,
      controller: _otp,
      onCompleted: (value) {},
      defaultPinTheme: PinTheme(
        width: 45,
        height: 50,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      closeKeyboardWhenCompleted: true,
      length: 6,
    );
  }
}
