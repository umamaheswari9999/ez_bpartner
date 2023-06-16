import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/add_attachment/add_attachment_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/attachment_doc_types/attachment_doc_types_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/download_attachment/download_attachment_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/loan_attachments/loan_attachments_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/screen/new_consumer_loan/step_decider_screen.dart';
import 'package:ez_flutter/features/loans/presentation/widget/add_attachment_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_attachments_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_steps/additional_details_step.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_steps/bank_details_step.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_steps/esign_emandate_step.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_steps/kyc_review_step.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_steps/kyc_step.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_steps/loan_details_step.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_steps/pre_approval_step.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/screen_utils.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/model/simple.dart';
import 'package:ez_flutter/shared/widget/go_back.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsumerLoanStepsScreen extends StatefulWidget {
  const ConsumerLoanStepsScreen({Key? key}) : super(key: key);

  @override
  State<ConsumerLoanStepsScreen> createState() =>
      _ConsumerLoanStepsScreenState();
}

class _ConsumerLoanStepsScreenState extends State<ConsumerLoanStepsScreen> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _currentStep = BlocProvider.of<NewLoanCubit>(context).state.currentStep;
  }

  @override
  Widget build(BuildContext context) {
    final preEnquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form!;
    const emptyWidget = SizedBox();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(preEnquiryForm.preEnquiryNumber,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(preEnquiryForm.customerName.trim(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        // backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        titleSpacing: 0,
        leading: const GoBack(),
        actions: [
          IconButton(
            onPressed: () {
              final preEnquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form!;
              BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(preEnquiryForm.preEnquiryNumber, preEnquiryForm.pan!);
            },
            icon: const Icon(FeatherIcons.refreshCcw,color: Colors.white,),
          ),
          if (preEnquiryForm.isDisbursed == false) ...[
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (ctx) => locator.get<LoanAttachmentsCubit>()..fetchLoanAttachments(preEnquiryForm.id)),
                        BlocProvider(
                          create: (ctx) => locator.get<DownloadAttachmentCubit>()),
                      ],
                      child: LoanAttachmentsWidget(loanId: preEnquiryForm.id),
                    );
                  },
                );
              },
              icon: const Icon(FeatherIcons.file,color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet<Simple>(
                  context: context,
                  builder: (ctx) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (ctx) => locator.get<AddAttachmentCubit>()),
                        BlocProvider(
                          create: (ctx) => locator.get<AttachmentDocTypesCubit>()..fetchAttachmentDocTypes(),
                        ),
                      ],
                      child: AddAttachmentWidget(loanId: preEnquiryForm.id),
                    );
                  },
                ).then((value) {
                  if (value != null) {
                    showSnackbar(context, '${value.title} uploaded successfully');
                  }
                });
              },
              icon: const Icon(FeatherIcons.upload,color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                openChatScreen(context, preEnquiryForm.id,preEnquiryForm.preEnquiryNumber);
              },
              icon: const Icon(FeatherIcons.messageCircle,color: Colors.white),
            ),
          ],
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          final form2 = BlocProvider.of<NewLoanCubit>(context).state.form;
          if (form2 != null) {
            BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(form2.preEnquiryNumber, form2.poiNumber ?? '');
          }
          return Future.delayed(const Duration(seconds: 3));
        },
        child: BlocConsumer<NewLoanCubit, NewLoanState>(
          listener: (ctx, state) {
            if (state.currentStep != _currentStep) {
              setState(() {
                _currentStep = state.currentStep;
              });
            }
          },
          builder: (context, state) {
            // if (state.isLoading) {
            //   return const Center(child: CircularProgressIndicator());
            // }
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.green,
                ),
              ),
              child: Stepper(
                physics: const AlwaysScrollableScrollPhysics(),
                controlsBuilder: (ctx, details) {
                  return Row(
                    children: <Widget>[
                      Container(child: null),
                      Container(child: null),
                    ],
                  );
                },
                currentStep: _currentStep,
                onStepTapped: (int step) {
                  if (step < _currentStep) {
                    // do not do anything
                  }
                },
                steps: [
                  Step(
                    title: const Text('KYC'),
                    state: _getStepState(NewLoanStepDeciderScreen.kycStep),
                    isActive: _getIsActive(NewLoanStepDeciderScreen.kycStep),
                    content: _currentStep == NewLoanStepDeciderScreen.kycStep
                      ? const KycStepWidget()
                      : emptyWidget,
                  ),
                  Step(
                    title: const Text('KYC Review'),
                    state: _getStepState(NewLoanStepDeciderScreen.reviewKycStep),
                    isActive: _getIsActive(NewLoanStepDeciderScreen.reviewKycStep),
                    content: _currentStep == NewLoanStepDeciderScreen.reviewKycStep
                      ? const KycReviewStepWidget()
                      : emptyWidget,
                  ),
                  Step(
                    title: const Text('Additional Information'),
                    state: _getStepState(NewLoanStepDeciderScreen.additionalDetailsStep),
                    isActive: _getIsActive(NewLoanStepDeciderScreen.additionalDetailsStep),
                    content: _currentStep == NewLoanStepDeciderScreen.additionalDetailsStep
                      ? const AdditionalDetailsStep()
                      : emptyWidget,
                  ),
                  Step(
                    title: const Text('Loan Details'),
                    state: _getStepState(NewLoanStepDeciderScreen.loanRequirementsStep),
                    isActive: _getIsActive(NewLoanStepDeciderScreen.loanRequirementsStep),
                    content: _currentStep == NewLoanStepDeciderScreen.loanRequirementsStep
                      ? const LoanDetailsStep()
                      : emptyWidget,
                  ),
                  Step(
                    title: const Text('Bank Details'),
                    state: _getStepState(NewLoanStepDeciderScreen.bankDetailsStep),
                    isActive: _getIsActive(NewLoanStepDeciderScreen.bankDetailsStep),
                    content: _currentStep == NewLoanStepDeciderScreen.bankDetailsStep
                      ? const BankDetailsStepWidget()
                      : emptyWidget,
                  ),
                  Step(
                    title: const Text('eSign & eMandate'),
                    state: _getStepState(NewLoanStepDeciderScreen.eSignAndeMandateStep),
                    isActive: _getIsActive(NewLoanStepDeciderScreen.eSignAndeMandateStep),
                    content: _currentStep == NewLoanStepDeciderScreen.eSignAndeMandateStep
                      ? const ESignAndEMandateStepWidget()
                      : emptyWidget,
                  ),
                  Step(
                    title: const Text('Final Approval/Disburse'),
                    state: _getStepState(NewLoanStepDeciderScreen.preApprovalStep),
                    isActive: _getIsActive(NewLoanStepDeciderScreen.preApprovalStep),
                    content: _currentStep == NewLoanStepDeciderScreen.preApprovalStep
                      ? const PreApprovalStepWidget()
                      : emptyWidget,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  StepState _getStepState(int stepNumber) => stepNumber < _currentStep
      ? StepState.complete : _currentStep == stepNumber? StepState.editing : StepState.indexed;

  bool _getIsActive(int stepNumber) => stepNumber < _currentStep;
}
