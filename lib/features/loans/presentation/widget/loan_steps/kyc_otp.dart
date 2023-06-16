import 'package:dartz/dartz.dart' as dartz;
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/aadhar_kyc_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/screen_utils.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:ez_flutter/shared/widget/loading_widget.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class KycOtpWidget extends StatefulWidget {
  const KycOtpWidget({
    Key? key,
    required this.mobileNumber,
    required this.originalOtp,
  }) : super(key: key);

  final String mobileNumber;
  final String originalOtp;

  @override
  State<KycOtpWidget> createState() => _KycOtpWidgetState();
}

class _KycOtpWidgetState extends State<KycOtpWidget> {
  final OtpFieldController _controller = OtpFieldController();
  String? originalOtp;
  String enteredOtp = '';

  @override
  void initState() {
    super.initState();

    originalOtp = widget.originalOtp;
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(12.0);
    const elevation = 0.0;

    return BlocListener<NewLoanActionCubit, NewLoanActionState>(
      listener: (ctx, state) {
        state.maybeWhen(
          success: (action, data) {
            if (action == NewLoanAction.resendOtp) {
              showSnackbar(context, 'OTP sent successfully');

              if (data != null) {
                setState(() {
                  originalOtp = data['otp'] as String;
                });
              }
            } else if (action == NewLoanAction.verifyOtpAndDoKyc) {
              if (data != null && data['data'] != null) {
                var details =
                    data['data'] as dartz.Tuple2<PreEnquiryForm, Customer>;
                final preEnquiry = details.value1;
                final customer = details.value2;

                BlocProvider.of<NewLoanCubit>(context).moveToNextStep(form: preEnquiry, customer: customer);
              }
            } else if (action == NewLoanAction.createClientMaster) {
              final preEnquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form!;
              BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(preEnquiryForm.preEnquiryNumber, preEnquiryForm.pan!, shouldMoveToNextStep: false);
            }
          },
          failure: (action, f) {
            if (action == NewLoanAction.verifyOtpAndDoKyc) {
              showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text(
                    'Failed to fetch details from CKYC.\nDo you want to initiate the Aadhar KYC?',
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    PrimaryButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        final shouldSkip = await askForKycSkip(context);
                        if (shouldSkip == true) {
                          final preEnquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form!;
                          BlocProvider.of<NewLoanActionCubit>(context).createClientMaster(preEnquiryForm);
                        }
                      },
                      text: 'SKIP',
                      elevation: 0,
                      primary: Colors.black,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        Navigator.of(context).pop();


                        var preEnquiryForm =
                            BlocProvider.of<NewLoanCubit>(context).state.form!;

                        showModalBottomSheet(
                          context: context,
                          constraints: const BoxConstraints(
                            minHeight: 150,
                          ),
                          builder: (ctx) {
                            return MultiBlocProvider(
                              providers: [
                                BlocProvider.value(value: BlocProvider.of<NewLoanCubit>(context)),
                                BlocProvider.value(value: BlocProvider.of<NewLoanActionCubit>(context)),
                              ],
                              child: AadharKycWidget(
                                  aadharNumber: preEnquiryForm.poiNumber!),
                            );
                          },
                        ).then((value) {
                          if (value == true) {
                            BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(preEnquiryForm.preEnquiryNumber, preEnquiryForm.pan!, shouldMoveToNextStep: true);
                          }
                        });
                      },
                      text: 'YES',
                    ),
                  ],
                );
              },
            );
            }
          },
          orElse: () {},
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('An OTP has been sent to ${widget.mobileNumber}.'),
          const SizedBox(height: 12),
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
            onCompleted: (pin) {},
            onChanged: (value) {
              enteredOtp = value;
            },
          ),
          const SizedBox(height: 6),
          TextButton(
            onPressed: () {
              _resendOtp(context);
            },
            child: const Text('Resend'),
          ),
          const SizedBox(height: 12),
          BlocBuilder<NewLoanActionCubit, NewLoanActionState>(
            builder: (ctx, state) {
              bool isLoading =
                  state.maybeWhen(orElse: () => false, loading: (_) => true);

              return isLoading
                  ? const LoadingWidget()
                  : PrimaryButton(
                      text: 'Verify OTP & Continue'.toUpperCase(),
                      padding: padding,
                      elevation: elevation,
                      onPressed: () {
                        _verifyOtp(enteredOtp);
                      },
                    );
            },
          ),
        ],
      ),
    );
  }

  void _resendOtp(BuildContext context) {
    var form = BlocProvider.of<NewLoanCubit>(context).state.form;
    if (form != null) {
      BlocProvider.of<NewLoanActionCubit>(context).sendConsentOtp(form.id);
    }
  }

  void _verifyOtp(String otp) {
    var form = BlocProvider.of<NewLoanCubit>(context).state.form;
    BlocProvider.of<NewLoanActionCubit>(context)
        .verifyOtpAndFetchKycDetails(form!.id, originalOtp!, otp);
  }
}
