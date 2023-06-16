import 'package:dartz/dartz.dart' as dartz;
import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/ctxt_utils/overlay.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/lost_userid/lost_userid.dart';
import 'package:ez_flutter/features/auth/presentation/ui/lost_id/otp_screen.dart';
import 'package:ez_flutter/features/auth/presentation/widgets/input_filed2.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberVerifScrn extends StatefulWidget {
  const NumberVerifScrn({Key? key}) : super(key: key);

  @override
  State<NumberVerifScrn> createState() => _NumberVerifScrnState();
}

class _NumberVerifScrnState extends State<NumberVerifScrn> {
  late TextEditingController _phonenumber;
  late LoadingOverlay overlay;
  @override
  void initState() {
    super.initState();
    overlay = LoadingOverlay.of(context);
    _phonenumber = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: BlocListener<LostUseridCubit, LostUserid>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => overlay.show(),
            sentOTP: (number) {
              overlay.hide();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<LostUseridCubit>(context),
                    child: OTPScreen(phonenumer: number),
                  ),
                ),
              )
                  .then((value) {
                if (value == null) return;
                final res = value as dartz.Tuple2<bool?, bool?>;
                Navigator.of(context).pop(res);
              });
            },
            failure: (failure) {
              failure.maybeWhen(
                serverFailure: (code, message) {
                  overlay.hide();
                  if (code == 200) {
                    showSnackbar(
                        context, 'Entered invalid OTP.. Please check your OTP');
                  }
                },
                invalidFieldValue: (message) =>
                    showSnackbar(context, message ?? ''),
                apiFailure: (message) {
                  overlay.hide();
                  showSnackbar(context, message);
                },
                orElse: () {
                  overlay.hide();
                  showErrorDialog(
                      context, 'Can\'t able to send OTP Please try again.');
                },
              );
            },
            orElse: () => overlay.hide(),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(height: 24),
                    Text(
                      'Please enter your mobile number which is linked to your Account',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    VerticalSpacing.large,
                    InputFiled2(
                      controller: _phonenumber,
                      borderRadius: 12,
                      prefixWidget: const Text(
                        '+91 ',
                        style: TextStyle(fontSize: 16),
                      ),
                      showLabel: true,
                      labelText: 'Enter your phone number',
                      title: 'Enter your phone number',
                      maxLength: 10,
                    ),
                    VerticalSpacing.large,
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        text: 'SUBMIT',
                        onPressed: () {
                          BlocProvider.of<LostUseridCubit>(context)
                              .sendOTP(_phonenumber.text);
                        },
                      ),
                    ),
                    VerticalSpacing.large,
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pop(dartz.tuple2(null, null)),
                      child: const Text('Log In'),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pop(dartz.tuple2(null, true)),
                      child: const Text('Forgot Password?'),
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

  Widget _buildImage() {
    return SafeArea(
      child: Image.asset(
        ImagePaths.logo,
        width: 200,
        height: 200,
      ),
    );
  }
}
