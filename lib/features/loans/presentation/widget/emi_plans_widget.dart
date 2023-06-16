import 'package:ez_flutter/features/loans/domain/entity/emi_plan.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/emi_plans/emi_plans_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/emi_plan_widget.dart';
import 'package:ez_flutter/shared/widget/failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmiPlansWidget extends StatefulWidget {
  final String bpagent;
  final void Function(EmiPlan) onSelectedPlan;
  const EmiPlansWidget(
      {Key? key, required this.bpagent, required this.onSelectedPlan})
      : super(key: key);

  @override
  State<EmiPlansWidget> createState() => _EmiPlansWidgetState();
}

class _EmiPlansWidgetState extends State<EmiPlansWidget> {
  late PreEnquiryForm? enquiryForm;
  @override
  void initState() {
    super.initState();
    enquiryForm = BlocProvider.of<NewLoanCubit>(context).state.form;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewLoanCubit, NewLoanState>(
      listener: (context, state) {
        enquiryForm = state.form;
        setState(() {});
      },
      child: BlocConsumer<EmiPlansCubit, EmiPlansState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (records, emiAmout) {
              if (records.isNotEmpty) {
                // widget.onSelectedPlan(records.first);
              }
            },
            orElse: () {},
          );
        },
        builder: (ctx, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => CircleAvatar(
              backgroundColor: Colors.transparent,
              minRadius: 2,
              maxRadius: 2,
              child: Card(
                color: Theme.of(context).colorScheme.background,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            success: (data, amount) {
              if (data.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: ListTile(
                    minLeadingWidth: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey.shade400)
                    ),
                    leading: const Icon(Icons.warning,color: Colors.orange),
                    title: const Text('There are no active Loan Terms for this Agent.',textAlign: TextAlign.center,),
                  ),
                );
              }
              return ListView.separated(
                itemCount: data.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (ctx, index) => const SizedBox(height: 2),
                itemBuilder: (ctx, index) {
                  final bool selected = enquiryForm!.emiPlanId != null &&
                      enquiryForm!.emiPlanId == data[index].id;
                  return Stack(
                    alignment: AlignmentDirectional.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      InkWell(
                        onTap: () => widget.onSelectedPlan(data[index]),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: 18.0, top: index == 0 ? 20 : 0),
                          child: EmiPlanWidget(
                            plan: data[index],
                            amount: amount,
                          ),
                        ),
                      ),
                      if (index == 0) ...[
                        Positioned(
                          top: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.green.shade50,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'EZFinanz\'s choice',
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      Positioned(
                        bottom: 5,
                        child: selected
                            ? Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.green.shade50,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  );
                },
              );
            },
            failure: (f) => FailureWidget(
              failure: f,
              onRefresh: () {
                // BlocProvider.of<EmiPlansCubit>(context).fetchInitial(widget.bpagent,widget.amount);
              },
            ),
          );
        },
      ),
    );
  }
}
