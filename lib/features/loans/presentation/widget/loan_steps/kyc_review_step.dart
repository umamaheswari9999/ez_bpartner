import 'package:ez_flutter/constants/templates.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_location.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/add_attachment/add_attachment_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/attachment_doc_types/attachment_doc_types_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/download_attachment/download_attachment_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/states/states_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/add_attachment_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/edit_address_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/new_address_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/loan_rejected_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/pinhold_widget.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/model/simple.dart';
import 'package:ez_flutter/utils/string_utils.dart';
import 'package:ez_flutter/shared/widget/loading_widget.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KycReviewStepWidget extends StatefulWidget {
  const KycReviewStepWidget({Key? key}) : super(key: key);

  @override
  State<KycReviewStepWidget> createState() => _KycReviewStepWidgetState();
}

class _KycReviewStepWidgetState extends State<KycReviewStepWidget> {
  CustomerLocation? _location;
  bool _displayAddInPreform = false;
  @override
  void initState() {
    super.initState();
    final customer = BlocProvider.of<NewLoanCubit>(context).state.customer;
    if (customer != null) {
      BlocProvider.of<DownloadAttachmentCubit>(context).fetchDownloadAttachment(
        customer.master.id,
        Constants.kycPhotographName,
        Entities.clientMaster,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final customer = BlocProvider.of<NewLoanCubit>(context).state.customer;
    final preEnquiryFom = BlocProvider.of<NewLoanCubit>(context).state.form;

    if (customer == null || preEnquiryFom == null) {
      return const Text('Please complete previous step to continue');
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<NewLoanActionCubit, NewLoanActionState>(
          listener: (ctx, state) {
            state.maybeWhen(
              orElse: () {},
              success: (action, data) {
                if (action == NewLoanAction.completeKycReview ||
                    action == NewLoanAction.updatePreEnquiryStatus) {
                  if (data != null && data['loan'] != null) {
                    final data2 = data['loan'] as PreEnquiryForm;
                    BlocProvider.of<NewLoanCubit>(context)
                        .moveToNextStep(form: data2);
                  }
                }
              },
              failure: (action, f) {
                if (action == NewLoanAction.completeKycReview) {
                  f.maybeWhen(
                    orElse: () {
                      showSnackbar(context,
                          'Uh oh. Something went wrong. Please try again');
                    },
                    serverFailure: (code, error) {
                      showErrorDialog(
                        context,
                        error,
                        actions: [
                          PrimaryButton(
                            text: 'SKIP',
                            onPressed: () {
                              final preEnquiryId =
                                  BlocProvider.of<NewLoanCubit>(context)
                                      .state
                                      .form!
                                      .id;
                              BlocProvider.of<NewLoanActionCubit>(context)
                                  .updatePreEnquiryStatus(
                                preEnquiryId,
                                LoanStage.additionalInfo,
                              );
                              Navigator.of(context).pop(false);
                            },
                          )
                        ],
                      ).then((value) {
                        if (code == Constants.documentsNeededCode &&
                            value != false) {
                          final preEnquiryId =
                              BlocProvider.of<NewLoanCubit>(context)
                                  .state
                                  .form!
                                  .id;
                          showModalBottomSheet<Simple>(
                              context: context,
                              builder: (ctx) {
                                return MultiBlocProvider(
                                  providers: [
                                    BlocProvider(
                                        create: (ctx) =>
                                            locator.get<AddAttachmentCubit>()),
                                    BlocProvider(
                                      create: (ctx) {
                                        return locator
                                            .get<AttachmentDocTypesCubit>()
                                          ..fetchAttachmentDocTypes();
                                      },
                                    ),
                                  ],
                                  child:
                                      AddAttachmentWidget(loanId: preEnquiryId),
                                );
                              }).then((value) {
                            if (value != null) {
                              showSnackbar(context,
                                  '${value.title} uploaded successfully');
                            }
                          });
                        }
                      });
                    },
                    apiFailure: (error) => showErrorDialog(context, error),
                  );
                }
              },
            );
          },
        ),
        BlocListener<NewLoanCubit, NewLoanState>(
          listener: (context, state) {
            final hasCurrentAddressInClientMaster =
                customer.locations.isNotEmpty &&
                    customer.locations.first.currentAddress != null;
            if (hasCurrentAddressInClientMaster && _location == null) {
              setState(() {
                _location = customer.locations.first;
              });
            }
            final hasAddressInLoan = preEnquiryFom.currentAddressId != null &&
                preEnquiryFom.permanentAddressId != null;
            if (hasAddressInLoan) {
              setState(() {
                _displayAddInPreform = true;
              });
            }
          },
        ),
      ],
      child: BlocBuilder<NewLoanCubit, NewLoanState>(
        builder: (ctx, state) {
          final customer = state.customer!;
          final preEnquiryFom = state.form!;
          final hasCurrentAddressInClientMaster =
              customer.locations.isNotEmpty &&
                  customer.locations.first.currentAddress != null;
          final hasPermanentAddressInClientMaster =
              customer.locations.isNotEmpty &&
                  customer.locations.first.permanentAddress != null;
          final hasAddressInLoan = preEnquiryFom.currentAddressId != null &&
              preEnquiryFom.permanentAddressId != null;
          _displayAddInPreform = preEnquiryFom.currentAddressId != null &&
              preEnquiryFom.permanentAddressId != null;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: BlocBuilder<DownloadAttachmentCubit,
                    DownloadAttachmentState>(
                  builder: (ctx, state) {
                    return state.maybeWhen(
                      success: (data, fileName) =>
                          Image.memory(data, width: 64, height: 64),
                      orElse: () => const Icon(FeatherIcons.user),
                    );
                  },
                ),
                title: Text(customer.master.name),
                subtitle: Text(
                  StringUtils.getMaskedAadhaar(
                      customer.master.aadharNumber ?? ''),
                ),
                trailing: Text(
                  customer.master.gender ?? ''.toUpperCase(),
                ),
              ),
              if (_location != null && !_displayAddInPreform) ...[
                Text(
                  'Permanent Address'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 6),
                Text(
                    '${_location?.permanentAddress!.addressLine1.trim()}, ${_location?.permanentAddress!.addressLine2.trim()}'),
                const SizedBox(height: 2),
                Text(
                    '${_location?.permanentAddress!.stateName.trim()}, ${_location?.permanentAddress!.countryName.trim()}'),
                const SizedBox(height: 2),
                Text(
                    '${_location?.permanentAddress!.cityName.trim()}, ${_location?.permanentAddress!.postalCode.trim()}'),
              ],
              const SizedBox(height: 8),
              if (_location != null && !_displayAddInPreform) ...[
                const Divider(indent: 32),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Address'.toUpperCase(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 6),
                          Text(
                              '${_location?.currentAddress!.addressLine1.trim()}, ${_location?.currentAddress!.addressLine2.trim()}'),
                          const SizedBox(height: 2),
                          Text(
                              '${_location?.currentAddress!.stateName.trim()}, ${_location?.currentAddress!.countryName.trim()}'),
                          const SizedBox(height: 2),
                          Text(
                              '${_location?.currentAddress!.cityName.trim()}, ${_location?.currentAddress!.postalCode.trim()}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              if (_displayAddInPreform) ...[
                Text(
                  'Permanent Address'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 6),
                Text(preEnquiryFom.permanentAddressName ?? ''),
                const SizedBox(height: 12),
              ],
              if (_displayAddInPreform) ...[
                Text(
                  'Current Address'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 6),
                Text(preEnquiryFom.currentAddressName ?? ''),
              ],
              const SizedBox(height: 4),
              // if ((!hasCurrentAddressInClientMaster ||
              //         !hasPermanentAddressInClientMaster) &&
              //     !hasAddressInLoan) ...[
              if (customer.locations.length > 1) ...[
              const SizedBox(height: 4),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return EditAddressWidget(
                            defaultLocationId: preEnquiryFom.currentAddressId,
                            locations: customer.locations,
                          );
                        },
                      ),
                    ).then((value) {
                      if (value == null) return;

                      final form2 = BlocProvider.of<NewLoanCubit>(context).state.form;
                      _moveToNextStep(context, value);
                      if (form2 != null) {
                        BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(form2.preEnquiryNumber, form2.poiNumber ?? '');
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.edit),
                      SizedBox(width: 10),
                      Text('EDIT ADDRESS'),
                    ],
                  ),
                ),
              const SizedBox(height: 4),
              ],

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (ctx) => locator.get<StatesCubit>()..fetchStates()),
                            BlocProvider.value(
                              value: BlocProvider.of<NewLoanActionCubit>(context)),
                            BlocProvider.value(
                              value: BlocProvider.of<NewLoanCubit>(context)),
                          ],
                          child: const NewAddressWidget(),
                        );
                      },
                    ),
                  ).then((value) {
                    // if (value == true) {
                    final form2 =
                        BlocProvider.of<NewLoanCubit>(context).state.form;
                    if (form2 != null) {
                      BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(form2.preEnquiryNumber, form2.poiNumber ?? '');
                    }
                    // }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    SizedBox(width: 10),
                    Text('ADD NEW ADDRESS'),
                  ],
                ),
              ),
              // ],
              const SizedBox(height: 4),
              BlocBuilder<NewLoanActionCubit, NewLoanActionState>(
                builder: (ctx, state) {
                  final isLoading = state.maybeWhen(
                    orElse: () => false,
                    loading: (action) => true,
                  );

                  if (isLoading) {
                    return const LoadingWidget();
                  }

                  return BlocBuilder<NewLoanCubit, NewLoanState>(
                    builder: (context, state) {
                      final ishold = state.ishold;
                      final isRejected = state.form?.isRejected;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (ishold == true) ...[const PinHoldWidget()],
                          if (isRejected == true) ...[
                            const LoanRejectedWidget()
                          ],
                          PrimaryButton(
                            text: 'Continue'.toUpperCase(),
                            elevation: 0.0,
                            padding: const EdgeInsets.all(12.0),
                            onPressed: ishold == true || isRejected == true
                                ? null
                                : () => _moveToNextStep(context,_location),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _moveToNextStep(BuildContext context, CustomerLocation? location){
    final newLoanState = BlocProvider.of<NewLoanCubit>(context).state;
    final customer = newLoanState.customer!;
    final preEnquiryFom = newLoanState.form!;
    final hasCurrentAddressInClientMaster = customer.locations.isNotEmpty &&
        customer.locations.first.currentAddress != null;
    final hasPermanentAddressInClientMaster = customer.locations.isNotEmpty &&
        customer.locations.first.permanentAddress != null;
    final hasAddressInLoan = preEnquiryFom.currentAddressId != null &&
        preEnquiryFom.permanentAddressId != null;
    final loanId = newLoanState.form!.id;
    if (location != null) {
      BlocProvider.of<NewLoanActionCubit>(context).updateAddressInForm(
        loanId,
        location.permanentAddress!.id,
        location.currentAddress!.id,
      ).then((value) => {
        BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(preEnquiryFom.preEnquiryNumber, preEnquiryFom.poiNumber ?? '')
      });
    } else if (hasAddressInLoan) {
      BlocProvider.of<NewLoanActionCubit>(context).completeKycReview(
        loanId,
        newLoanState.customer!,
        preEnquiryFom.permanentAddressId!,
        preEnquiryFom.currentAddressId!,
      );
    } else if (hasCurrentAddressInClientMaster && hasPermanentAddressInClientMaster) {
      final location = newLoanState.customer!.locations.first;
      BlocProvider.of<NewLoanActionCubit>(context).completeKycReview(
        loanId,
        newLoanState.customer!,
        location.permanentAddress!.id,
        location.currentAddress!.id,
      );
    } else {
      showSnackbar(context, 'Please add at least one address to continue');
    }
  }
}
