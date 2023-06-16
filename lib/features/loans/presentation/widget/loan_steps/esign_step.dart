import 'package:ez_flutter/constants/templates.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter_share/flutter_share.dart';

class ESignStepWidget extends StatelessWidget {
  const ESignStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding =  EdgeInsets.all(12.0);
    const elevation = 0.0;
    final enquiryForm = BlocProvider.of<NewLoanCubit>(context).state.enquiryForm;

    if (enquiryForm == null) {
      return const Center(
        child: Text('No enquiry form found for this loan.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'To proceed further to disburse the loan customer has to sign the application document.',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 12),
        BlocConsumer<NewLoanActionCubit, NewLoanActionState>(
          listener: (ctx, state) {
            state.maybeWhen(
              success: (action, data) {
                if ((action == NewLoanAction.sendSignLink ||
                        action == NewLoanAction.resendESignLink) &&
                    data != null) {
                  final loanData = data['loan']
                      as dartz.Tuple2<PreEnquiryForm, PreEnquiryForm>;
                  final preEnquiry = loanData.value1;

                  showSnackbar(context, 'Process completed successfully');
                  BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(
                      preEnquiry.preEnquiryNumber, preEnquiry.pan!);
                  BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(
                      preEnquiry.preEnquiryNumber, preEnquiry.pan!);
                }
              },
              failure: (action, f) {
                if (action == NewLoanAction.sendSignLink ||
                    action == NewLoanAction.resendESignLink) {
                  f.maybeWhen(
                    invalidFieldValue: (message) => showSnackbar(context, message!),
                      orElse: () =>
                          showSnackbar(context, 'Uh oh. Something went wrong.'),
                      serverFailure: (code, error) =>
                          showSnackbar(context, error));
                }
              },
              orElse: () {},
            );
          },
          builder: (ctx, state) {
            final isLoading = state.maybeWhen(
              orElse: () => false,
              loading: (action) => action == NewLoanAction.sendSignLink,
            );

            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(strokeWidth: 2.0),
              );
            }

            return BlocBuilder<NewLoanCubit, NewLoanState>(
              builder: (ctx, newLoanState) {
                final eSignStatus = newLoanState.enquiryForm?.eSignStatus;
                final isRejected = eSignStatus == Constants.eSignStatusRejected;

                if (isRejected) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      children: const [
                        Icon(Icons.cancel_outlined, color: Colors.red),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Your eSign has been rejected. Please re-initiate again.',
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: _buildESignButton(context),
                    ),
                  );
                }

                if (newLoanState.enquiryForm!.eSignUrl?.isNotEmpty == true &&
                    newLoanState.enquiryForm!.eSignDocumentId?.isNotEmpty ==
                        true) {
                  final isApproved = eSignStatus != null &&
                      eSignStatus.isNotEmpty &&
                      eSignStatus == Constants.eSignStatusApproved;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: isApproved ? null : () => _openUrl,
                        contentPadding: EdgeInsets.zero,
                        leading: isApproved
                            ? const Icon(
                                Icons.verified_rounded,
                                color: Colors.green,
                              )
                            : isRejected
                                ? const Icon(Icons.clear, color: Colors.red)
                                : const Icon(Icons.access_time,
                                    color: Colors.orange),
                        title: Text(
                          isApproved
                              ? 'eSign is Approved'
                              : 'eSign link sent successfully. Waiting for eSign completion.',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        subtitle: isApproved
                            ? null
                            : Text(
                                newLoanState.enquiryForm?.eSignUrl ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                        trailing: kIsWeb
                            ? null
                            : IconButton(
                                onPressed: () => _shareUrl(newLoanState),
                                icon: const Icon(Icons.share),
                              ),
                      ),
                      if (!isApproved) ...[
                        const SizedBox(height: 6),
                        PrimaryButton(
                          text: 'RESEND LINK',
                          padding: padding,
                          elevation: elevation,
                          primary: Theme.of(context).colorScheme.inversePrimary,
                          onPressed: () => _callESignProcess(
                              context, Constants.eSignActionResend),
                        ),
                        const SizedBox(height: 4),
                        PrimaryButton(
                          text: 'CHECK STATUS',
                          padding: padding,
                          elevation: elevation,
                          onPressed: () =>
                              _callESignProcess(context, 'CHECK_STATUS'),
                        ),
                      ],
                    ],
                  );
                }

                return _buildESignButton(context);
              },
            );
          },
        )
      ],
    );
  }

  PrimaryButton _buildESignButton(BuildContext context) {
    return PrimaryButton(
      text: 'INITIATE E-SIGN',
      padding: const EdgeInsets.all(12.0),
      elevation: 0,
      onPressed: () => _callESignProcess(context, ''),
    );
  }

  void _callESignProcess(BuildContext context, String action) {
    final enquiryId =
        BlocProvider.of<NewLoanCubit>(context).state.enquiryForm!.id;
    final preEnquiryId = BlocProvider.of<NewLoanCubit>(context).state.form!.id;
    BlocProvider.of<NewLoanActionCubit>(context)
        .sendESignLink(enquiryId, preEnquiryId, action);
  }

  void _openUrl(NewLoanState newLoanState) {
    final eSignUrl = newLoanState.enquiryForm?.eSignUrl;
    if (eSignUrl != null) {
      launchUrlExternal(eSignUrl);
    }
  }

  void _shareUrl(NewLoanState newLoanState) async {
    final eSignUrl = newLoanState.enquiryForm?.eSignUrl;
    final details = locator.get<AppStaticData>();
    final name = newLoanState.enquiryForm?.customerName;
    if (eSignUrl != null) {
      const message = Templates.shareEsign;
      final formmatedMsg = message
          .replaceAll("{var1}", name ?? '')
          .replaceAll("{var2}", details.contactUsEmail)
          .replaceAll("{var3}", details.contactUsNumber);
      await FlutterShare.share(
        title: 'Share eSign URL',
        text: formmatedMsg,
        linkUrl: eSignUrl,
        chooserTitle: 'Share via',
      );
    }
  }
}
