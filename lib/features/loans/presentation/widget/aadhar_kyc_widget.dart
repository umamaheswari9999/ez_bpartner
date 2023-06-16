import 'package:ez_flutter/features/loans/domain/entity/aadhaar_kyc_response.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/screen_utils.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class AadharKycWidget extends StatefulWidget {
  const AadharKycWidget({
    Key? key,
    required this.aadharNumber,
  }) : super(key: key);

  final String aadharNumber;

  @override
  State<AadharKycWidget> createState() => _AadharKycWidgetState();
}

class _AadharKycWidgetState extends State<AadharKycWidget> {
  final OtpFieldController _controller = OtpFieldController();
  String? _enteredOtp;
  String? _clientId;
  bool _editAadhar = false;
  bool _success = false;
  final TextEditingController _aadhaarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _aadhaarController.text = widget.aadharNumber;
    _sendOtp();
  }

  void _sendOtp() {
    BlocProvider.of<NewLoanActionCubit>(context)
        .sendAadharKycOtp(_aadhaarController.text);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_success) return true;
        var shouldSkip = await askForKycSkip(context);
        if (shouldSkip == true) {
          final preEnquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form!;
          BlocProvider.of<NewLoanActionCubit>(context).createClientMaster(preEnquiryForm);
        }
        return true;
      },
      child: BlocConsumer<NewLoanActionCubit, NewLoanActionState>(
        listener: (ctx, state) {
          state.maybeWhen(
            orElse: () {},
            success: (action, data) {
              if (action == NewLoanAction.sendAadharKycOtp) {
                var response = data!['data'] as AadhaarKycResponse;

                if (response.otpSent) {
                  setState(() {
                    _clientId = response.clientId;
                    _editAadhar = false;
                  });
                } else if (response.validAadhaar == false) {
                  showErrorDialog(context,
                      'This is not a valid aadhaar number. Please enter valid aadhaar number to continue');
                }
              } else if (action == NewLoanAction.verifyAadharKycOtp) {
                _success = true;
                showSnackbar(context, 'KYC Completed Successfully');
                Navigator.of(context).pop(true);
              }
            },
            failure: (action, f) {
              if (action == NewLoanAction.sendAadharKycOtp ||
                  action == NewLoanAction.verifyAadharKycOtp) {
                var message = f.maybeWhen(
                    orElse: () =>
                        'Something went wrong. Please try again later',
                    serverFailure: (_, message) => message);
                showErrorDialog(context, message);
              }
            },
          );
        },
        builder: (ctx, state) {
          var isLoading =
              state.maybeWhen(orElse: () => false, loading: (_) => true);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Aadhaar KYC',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'An OTP has been sent to the mobile number linked to aadhaar number ${_aadhaarController.text}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _editAadhar = true;
                          });
                        },
                        icon: Icon(Icons.edit)),
                  ],
                ),
                const SizedBox(height: 12),
                if (_editAadhar) ...[
                  TextFormField(
                    controller: _aadhaarController,
                    decoration: const InputDecoration(
                      hintText: 'Aadhaar Number',
                    ),
                    maxLength: 12,
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    text: isLoading ? 'Please wait...' : 'NEXT',
                    onPressed: isLoading
                        ? null
                        : () {
                            _sendOtp();
                          },
                  ),
                ],
                if (_editAadhar == false) ...[
                  OTPTextField(
                    controller: _controller,
                    length: Constants.kycOtpLength,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.zero,
                    fieldWidth: 40,
                    style: const TextStyle(fontSize: 24),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    outlineBorderRadius: 8,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      _enteredOtp = pin;
                    },
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: isLoading ? 'Please wait...' : 'SUBMIT',
                    onPressed: isLoading
                        ? null
                        : () {
                            var preEnquiryForm =
                                BlocProvider.of<NewLoanCubit>(context)
                                    .state
                                    .form!;

                            BlocProvider.of<NewLoanActionCubit>(context)
                                .verifyAadharKycOtp(_aadhaarController.text,
                                    _clientId!, _enteredOtp!, preEnquiryForm);
                          },
                  ),
                ]
              ],
            ),
          );
        },
      ),
    );
  }
}
