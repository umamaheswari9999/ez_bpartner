import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/domain/entity/emi_plan.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/emi_plans/emi_plans_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/emi_plan_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/emi_plans_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/loan_eligibility_check_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/bs_analyzer.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/loan_decision_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/loan_rejected_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/pinhold_widget.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoanDetailsStep extends StatefulWidget {
  const LoanDetailsStep({Key? key}) : super(key: key);

  @override
  State<LoanDetailsStep> createState() => _LoanDetailsStepState();
}

class _LoanDetailsStepState extends State<LoanDetailsStep> {
  final TextEditingController _amountController = TextEditingController();
  final EmiPlan? _plan = null;

  @override
  void initState() {
    super.initState();
    final enquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form;

    if (enquiryForm != null && enquiryForm.loanAmount != null) {
      _amountController.text = double.parse(enquiryForm.loanAmount.toString())
          .toStringAsFixed(0)
          .toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final staticData = locator.get<AppStaticData>();

    return BlocListener<NewLoanActionCubit, NewLoanActionState>(
      listener: (ctx, state) {
        state.maybeWhen(
          success: (action, data) {
            if (action == NewLoanAction.updateEmiDetails) {
              if (data != null && data['loan'] != null) {
                final data2 = data['loan'] as PreEnquiryForm;
                BlocProvider.of<NewLoanCubit>(context).setLoanDetails(data2);
              }
            }
          },
          orElse: () {},
        );
      },
      child: BlocConsumer<NewLoanCubit, NewLoanState>(
        listener: (ctx, state) {
          if (state.form?.loanAmount != null) {
            setState(() {
              _amountController.text = (state.form!.loanAmount).toString();
            });
          }
          if (state.form!.cibilDecision == LoanEligibility.rejected) {
            showLoanRejectionDialog(
              context,
              staticData.contactUsNumber,
              staticData.contactUsEmail,
            );
          }
        },
        builder: (ctx, state) {
          final form = state.form!;
          final shouldDisableEdit = form.finalDecision?.isNotEmpty == true;
          late bool isEligible;
          late bool doNotHaveEnoughLimit;
          if (form.downloadBs == true) {
            isEligible = form.manualFinaldecision == LoanEligibility.eligible &&
                form.manualRegularlimit != null &&
                form.loanAmount != null &&
                form.manualRegularlimit! >= form.loanAmount!;
            doNotHaveEnoughLimit =
                (form.manualFinaldecision == LoanEligibility.eligible &&
                    form.manualRegularlimit! < form.loanAmount!);
          } else {
            isEligible = form.cibilDecision == LoanEligibility.eligible &&
                form.cibilLimit != null &&
                form.loanAmount != null &&
                form.cibilLimit! >= form.loanAmount!;
            doNotHaveEnoughLimit =
                (form.cibilDecision == LoanEligibility.eligible &&
                    form.cibilLimit! < form.loanAmount!);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 6),
              Text('Loan Amount'.toUpperCase(), style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 2),
              _loanAmountField(context, shouldDisableEdit, form),
              if(state.ishold == true)...[
                const PinHoldWidget()
              ] else if (form.isRejected == true) ...[
                const LoanRejectedWidget()
              ] else ...[
                if (form.bpagent == null) ...[
                  Text(
                    'You dont have valid Business Partner.\nPlease contact operations team at',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () async => await connectToCustomerCare(staticData.contactUsNumber),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.phone, color: Colors.blue),
                        Text(staticData.contactUsNumber),
                      ],
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () async =>
                        await launchEmailTo(staticData.contactUsNumber),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.mail, color: Colors.blue),
                        Text(staticData.contactUsEmail),
                      ],
                    ),
                  ),
                ],
                if (!shouldDisableEdit && form.bpagent != null) ...[
                  BlocProvider.value(
                    value: BlocProvider.of<EmiPlansCubit>(context),
                    child: EmiPlansWidget(
                      bpagent: form.bpagent!,
                      onSelectedPlan: (plan) {
                        _setEmiDetails(context, _amountController.text, plan);
                      },
                    ),
                  ),
                ],
                if (form.emiPlanId != null) ...[
                  const SizedBox(height: 4),
                  BlocBuilder<EmiPlansCubit, EmiPlansState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        success: (records, emiAmout) => const SizedBox(),
                        orElse: () => _selectedPlan(form, context),
                      );
                    },
                  ),
                ],
                if (form.cibilDecision != null ||
                    form.manualFinaldecision != null) ...[
                  const LoanDecisionWidget(),
                ],
                if ((form.finalDecision == LoanEligibility.refer ||
                        doNotHaveEnoughLimit) &&
                    form.downloadBs != true) ...[
                  const SizedBox(height: 6),
                  BSAnalyzerWidget(key: ObjectKey(form)),
                ],
                const SizedBox(height: 6),
              ],
              BlocConsumer<NewLoanActionCubit, NewLoanActionState>(
                listener: (ctx, state) {
                  state.maybeWhen(
                    success: (action, data) {
                      if (action == NewLoanAction.completeLoanDetails) {
                        if (data != null && data['loan'] != null) {
                          final data2 = data['loan'] as PreEnquiryForm;
                          BlocProvider.of<NewLoanCubit>(context)
                              .moveToNextStep(form: data2);
                        }
                      }
                    },
                    failure: (action, f) {
                      if (action == NewLoanAction.completeLoanDetails) {
                        showSnackbar(context, f.toString());
                      }
                    },
                    orElse: () {},
                  );
                },
                builder: (ctx, state) {
                  final isLoading = state.maybeWhen(
                    orElse: () => false,
                    loading: (action) {
                      if (action == NewLoanAction.generateBSAnalyzerLink) {
                        return false;
                      }
                      if (action == NewLoanAction.downloadBankStatement) {
                        return false;
                      }
                      return true;
                    },
                  );

                  if (isLoading) {
                    return const Center(
                      child:
                          CircularProgressIndicator.adaptive(strokeWidth: 2.0),
                    );
                  }
                  return BlocBuilder<NewLoanCubit, NewLoanState>(
                    builder: (context, state) {
                      final ishold = state.ishold;
                      final isRejected = state.form?.isRejected ?? false;
                      final isNotValid =  (form.loanAmount == null && form.emiPlanId == null);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          PrimaryButton(
                            text: (form.cibilDecision == LoanEligibility.refer
                                ? 'VERIFY'
                                : form.cibilDecision == null
                                    ? 'CHECK ELIGIBILITY'
                                    : 'CONTINUE'),
                            onPressed: (ishold == true || isRejected || isNotValid)
                                ? null
                                : form.cibilDecision == LoanEligibility.rejected || isRejected
                                    ? null
                                    : () {
                                        if (isEligible) {
                                          BlocProvider.of<NewLoanActionCubit>(context).completeLoanRequirements(form.id, form.isPreApproved);
                                        } else if (form.cibilDecision == null || form.cibilDecision?.isEmpty == true) {
                                          if (double.tryParse(_amountController.text) == null) {
                                            showSnackbar(context,'Please enter valid amount');
                                          } else {
                                            if (form.emiPlanId == null) {
                                              showSnackbar(context, 'Please select LoanTerm');
                                            } else {
                                              _checkLoanEligibility();
                                            }
                                          }
                                        } else if (form.cibilDecision == LoanEligibility.refer) {
                                          final preEnquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form!;
                                          BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(
                                            preEnquiryForm.preEnquiryNumber,
                                            preEnquiryForm.pan!,
                                          );
                                        } else {
                                          if (form.cibilLimit == null) {
                                            showSnackbar(context, 'Not able to find CIBIL limit');
                                          } else if (form.loanAmount == null) {
                                            showSnackbar(context, 'Please enter valid loan amount');
                                          } else if (doNotHaveEnoughLimit) {
                                            final details = locator.get<AppStaticData>();
                                            showSnackbar(context,
                                                'Eligible limit is less than loan amount. Please contact operations at ${details.contactUsNumber},${details.contactUsEmail}');
                                          } else {
                                            showSnackbar(context, 'Something is wrong. Please cross check the loan details.');
                                          }
                                        }
                                      },
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

  Widget _selectedPlan(PreEnquiryForm form, BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: EmiPlanWidget(
            plan: EmiPlan(
              id: form.emiPlanId!,
              name: form.emiPlanName!
                  .replaceAll(form.bpagentName!, '')
                  .replaceAll('-', '')
                  .trim(),
              totalemis: (form.loanAmount!.toDouble() / form.emiAmount!.toDouble()).round(),
              interestrate: form.annIntRate!.toStringAsFixed(2),
              advemi: form.advanceEmi!.toInt(),
              downPayment: form.downPaymentCollected!.toStringAsFixed(2),
              emiAmount: form.emiAmount!.toStringAsFixed(2),
            ),
            amount: form.loanAmount.toString(),
          ),
        ),
        Positioned(
          top: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade50),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.radio_button_checked,
                  color: Colors.white,
                  size: 12,
                ),
                const SizedBox(width: 4),
                Text(
                  'You\'ve selected',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _loanAmountField(
      BuildContext context, bool shouldDisableEdit, PreEnquiryForm form) {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration.collapsed(
                  hintText: 'Enter loan amount'),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(letterSpacing: 1.7),
              readOnly: shouldDisableEdit,
              enabled: !shouldDisableEdit,
              onSubmitted: (value) =>
                  _setEmiDetails(context, _amountController.text, _plan),
            ),
          ),
          if (!shouldDisableEdit) ...[
            InkWell(
              onTap: () async {
                if (form.bpagent == null) {
                  showSnackbar(
                      context, 'You dont have any BPAgent to progress.');
                } else {
                  await _setEmiDetails(context, _amountController.text, null);
                  if (!mounted) return;
                  BlocProvider.of<EmiPlansCubit>(context)
                      .fetchInitial(form.bpagent!, _amountController.text);
                }
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                ),
                child: const Center(
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _checkLoanEligibility() {
    final form = BlocProvider.of<NewLoanCubit>(context).state.form!;

    showModalBottomSheet(
      context: context,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 150),
      builder: (ctx) {
        return BlocProvider.value(
          value: BlocProvider.of<NewLoanActionCubit>(context)
            ..checkCibilLimit(form.id),
          child: LoanEligibilityCheckWidget(loanId: form.id),
        );
      },
    ).then((value) {
      // if (value == true) {
      BlocProvider.of<NewLoanCubit>(context).refreshFormAndCustomer(
        form.preEnquiryNumber,
        form.poiNumber ?? '',
      );
      // }
    });
  }

  Future<void> _setEmiDetails(
      BuildContext context, String amount, EmiPlan? plan) async {
    final enquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form;
    BlocProvider.of<NewLoanActionCubit>(context).updateEmiDetails(
      enquiryForm!.id,
      amount,
      plan,
    );
  }
}
