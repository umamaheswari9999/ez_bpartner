import 'package:ez_flutter/features/auth/presentation/bloc/forgot_pswd/forgot_pswd.dart';
import 'package:ez_flutter/utils/string_utils.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class FPswdOTPWidget extends StatefulWidget {
  const FPswdOTPWidget({Key? key}) : super(key: key);

  @override
  State<FPswdOTPWidget> createState() => _FPswdOTPWidgetState();
}

class _FPswdOTPWidgetState extends State<FPswdOTPWidget> {
  late TextEditingController _otp;
  @override
  void initState() {
    super.initState();
    _otp = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<ForgotPswdCubit>(context).emitUserIdScrn();
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          BlocBuilder<ForgotPswdCubit, ForgotPswd>(
            builder: (context, state) {
              return Text(
                'Please enter 6 digits vertification code sent to your number +91 ${StringUtils.getMaskedMobileNumber(state.phonenumber)}.',
                textAlign: TextAlign.center,
                maxLines: null,
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                  letterSpacing: 1.1,
                ),
              );
            },
          ),
          VerticalSpacing.medium,
          _buildOTPFields(),
          VerticalSpacing.large,
          PrimaryButton(
            onPressed: () {
              BlocProvider.of<ForgotPswdCubit>(context).validateOTP(_otp.text);
            },
            text: 'VERIFY',
          ),
        ],
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
