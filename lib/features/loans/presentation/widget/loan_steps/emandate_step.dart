import 'package:ez_flutter/constants/templates.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_mandate.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/currency_formatter_utils.dart';
import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

class EMandateStepWidget extends StatefulWidget {
  const EMandateStepWidget({Key? key}) : super(key: key);

  @override
  State<EMandateStepWidget> createState() => _EMandateStepWidgetState();
}

class _EMandateStepWidgetState extends State<EMandateStepWidget> {
  CustomerMandate? _mandate;

  @override
  Widget build(BuildContext context) {
    var padding = const EdgeInsets.all(12.0);
    var elevation = 0.0;

    return BlocBuilder<NewLoanActionCubit, NewLoanActionState>(
      builder: (ctx, state) {
        final isLoading = state.maybeWhen(
          orElse: () => false,
          loading: (action) => action == NewLoanAction.sendEMandateLink,
        );

        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(strokeWidth: 2.0),
          );
        }

        return BlocBuilder<NewLoanCubit, NewLoanState>(
          builder: (ctx, newLoanState) {
            final emiAmount =
                BlocProvider.of<NewLoanCubit>(context).state.form!.emiAmount!;
            final mandates = BlocProvider.of<NewLoanCubit>(context)
                    .state
                    .customer
                    ?.mandates
                    .where((element) =>
                        Constants.eMandateStatusSuccess ==
                            element.mandateStatus.toLowerCase() &&
                        element.amountRegistered >= emiAmount &&
                        element.isCanceled == false)
                    .toList() ??
                <CustomerMandate>[];

            final eMandateStage = newLoanState.enquiryForm?.eMandateStage;
            final isRejected =
                eMandateStage == Constants.eMandateStatusRejected;

            if (isRejected) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: const [
                    Icon(Icons.cancel_outlined, color: Colors.red),
                    SizedBox(width: 16),
                    Expanded(
                        child: Text(
                            'Your eMandate has been rejected. Please re-initiate again.')),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: _buildEMandateButton(context),
                ),
              );
            }

            final isApproved = eMandateStage != null &&
                eMandateStage.isNotEmpty &&
                eMandateStage == Constants.eMandateStatusApproved;

            if (newLoanState.enquiryForm!.eMandateUrl?.isNotEmpty == true &&
                newLoanState.enquiryForm!.eMandateId?.isNotEmpty == true) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
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
                          ? 'eMandate is approved'
                          : 'eMandate link sent successfully. Waiting for eMandate completion.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    subtitle: isApproved
                        ? null
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                child: Text(
                                  newLoanState.enquiryForm?.eMandateUrl ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () => _openUrl(newLoanState),
                              ),
                            ],
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
                      onPressed: () => _callEmandateProcess(
                          context, Constants.eSignActionResend),
                    ),
                    const SizedBox(height: 4),
                    PrimaryButton(
                      text: 'CHECK STATUS',
                      padding: padding,
                      elevation: elevation,
                      onPressed: () => _callEmandateProcess(context, 'status'),
                    ),
                    const SizedBox(height: 4),
                  ],
                ],
              );
            } else if (mandates.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You can select one of the below mandates to continue',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 6),
                  buildListView(context, mandates),
                  const Text('OR', textAlign: TextAlign.center),
                  const SizedBox(height: 6),
                  _buildEMandateButton(context),
                ],
              );
            } else {
              return _buildEMandateButton(context);
            }
          },
        );
      },
    );
  }

  Widget buildListView(BuildContext context, List<CustomerMandate> mandates) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: mandates.length,
      separatorBuilder: (ctx, idx) => const Divider(indent: 16),
      itemBuilder: (ctx, idx) {
        final mandate = mandates[idx];

        return RadioListTile<CustomerMandate>(
          contentPadding: EdgeInsets.zero,
          value: mandate,
          groupValue: _mandate,
          onChanged: (selectedMandate) {
            if (selectedMandate != null) {
              setState(() {
                _mandate = selectedMandate;
              });
              final enquiryForm =
                  BlocProvider.of<NewLoanCubit>(context).state.enquiryForm!;
              BlocProvider.of<NewLoanActionCubit>(context)
                  .updateMandateDetails(enquiryForm.id, selectedMandate);
            }
          },
          title: Text(mandate.umrn),
          subtitle: Text(
              '${Constants.mapMandateType(mandate.mandateType)} - ${CurrencyFormatter.getFormattedAmount(double.parse(mandate.amountRegistered.toString()))}'),
        );
      },
    );
  }

  PrimaryButton _buildEMandateButton(BuildContext context) {
    return PrimaryButton(
      text: 'INITIATE NEW MANDATE',
      padding: const EdgeInsets.all(12.0),
      elevation: 0,
      onPressed: () => _callEmandateProcess(context, Constants.actionInitiate),
    );
  }

  void _callEmandateProcess(BuildContext context, String action) {
    final enquiryId =
        BlocProvider.of<NewLoanCubit>(context).state.enquiryForm!.id;
    final preEnquiryId = BlocProvider.of<NewLoanCubit>(context).state.form!.id;
    BlocProvider.of<NewLoanActionCubit>(context)
        .sendEMandateLink(enquiryId, preEnquiryId, action);
  }

  void _openUrl(NewLoanState newLoanState) async {
    final eSignUrl = newLoanState.enquiryForm?.eMandateUrl;
    if (eSignUrl != null) {
      await launchUrlExternal(eSignUrl);
    }
  }

  void _shareUrl(NewLoanState newLoanState) async {
    final eSignUrl = newLoanState.enquiryForm?.eMandateUrl;
    final details = locator.get<AppStaticData>();
    final name = '${newLoanState.enquiryForm?.customerName}';
    if (eSignUrl != null) {
      const message = Templates.shareEmandate;
      final fomattedmsg = message
          .replaceAll("{var1}", name)
          .replaceAll("{var2}", details.contactUsEmail)
          .replaceAll("{var3}", details.contactUsNumber);

      await FlutterShare.share(
        title: 'Share eMandate URL',
        text: fomattedmsg,
        linkUrl: eSignUrl,
        chooserTitle: 'Share via',
      );
    }
  }
}
