import 'package:ez_flutter/features/loans/domain/entity/bank_by_ifsc.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_bank.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/bank_accounts/bank_accounts_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/choice_chip_list_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/input_field.dart';
import 'package:ez_flutter/local/static_data.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:ez_flutter/shared/model/simple.dart';
import 'package:ez_flutter/shared/widget/loading_widget.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBankWidget extends StatefulWidget {
  const NewBankWidget({
    Key? key,
    required this.loanId, this.bank,
  }) : super(key: key);

  final String loanId;
  final CustomerBank? bank;

  @override
  State<NewBankWidget> createState() => _NewBankWidgetState();
}

class _NewBankWidgetState extends State<NewBankWidget> {
  String? _actType = StaticData.accountTypes[1].id;
  String? _bankName;
  final TextEditingController _actNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ifscCode = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _micrCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.bank != null) {
      var bank = widget.bank!;
      _actNumberController.text = bank.accountNumber;
      _ifscCode.text = bank.ifscCode;
      _micrCodeController.text = bank.micrCode?.toString() ?? '';
      _fetchBankDetails(context, bank.ifscCode);
      _actType = bank.accountType;
    }
  }

  @override
  Widget build(BuildContext context) {
    const verticalSpacing = SizedBox(height: 4);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Bank'),
        elevation: 0,
      ),
      body: BlocListener<NewLoanActionCubit, NewLoanActionState>(
        listener: (ctx, state) {
          state.maybeWhen(
            orElse: () {},
            success: (action, data) {
              if (action == NewLoanAction.fetchBankDetailsByIfsc &&
                  data != null) {
                var bankByIfsc = data['data'] as BankByIfsc;

                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  setState(() {
                    _bankName = bankByIfsc.bankBranchId;
                    _branchNameController.text = bankByIfsc.bankBranchName;
                    _micrCodeController.text = bankByIfsc.micr;
                  });
                });
              }
            },
            failure: (action, f) {
              if (action == NewLoanAction.fetchBankDetailsByIfsc) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  setState(() {
                    _bankName = null;
                    _branchNameController.text = '';
                    _micrCodeController.text = '';
                  });
                });
              } else if (action == NewLoanAction.addNewBank) {
                final msg = f.maybeWhen(orElse: () => 'Uh oh. Something went wrong. Please try again', serverFailure: (code, message) {
                  return message;
                });
                showErrorDialog(context, msg);
              }
            },
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              InputField(
                controller: _ifscCode,
                hintText: 'IFSC Code',
                maxLength: 11,
                textCapitalization: TextCapitalization.characters,
                onChanged: (ifscCode) {
                  if (ifscCode.length == 11) {
                    _fetchBankDetails(context, ifscCode);
                  }
                },
                onSubmit: (ifscCode) {
                  _fetchBankDetails(context, ifscCode);
                },
              ),
              verticalSpacing,
              verticalSpacing,
              InputField(
                controller: _actNumberController,
                hintText: 'Account Number',
                keyboardType: TextInputType.number,
              ),
              ChoiceChoiceListWidget(
                title: 'Account Type',
                items: StaticData.accountTypes,
                defaultSelection: _actType,
                onSelected: (value) {
                  _actType = value;
                },
              ),
              verticalSpacing,
              verticalSpacing,
              BlocBuilder<BankAccountsCubit, BankAccountsState>(
                builder: (ctx, state) {
                  return state.when(
                    initial: () => const LoadingWidget(),
                    loading: () => const LoadingWidget(),
                    success: (banks, _) {
                      return _buildBanksDropdown(banks);
                    },
                    failure: (f) {
                      return _buildBanksDropdown(<Simple>[]);
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              InputField(
                controller: _branchNameController,
                hintText: 'Branch Name',
              ),
              verticalSpacing,
              InputField(
                controller: _micrCodeController,
                hintText: 'MICR Code',
              ),
              verticalSpacing,
              BlocConsumer<NewLoanActionCubit, NewLoanActionState>(
                listener: (ctx, state) {
                  state.maybeWhen(
                    success: (action, data) {
                      if (action == NewLoanAction.addNewBank) {
                        if (data != null && data['bank'] != null) {
                          var bank = data['bank'] as CustomerBank;
                          Navigator.of(context).pop(bank);
                        }
                      }
                    },
                    failure: (action, f) {

                    },
                    orElse: () {},
                  );
                },
                builder: (ctx, state) {
                  bool isLoading = false;
                  state.maybeWhen(
                    orElse: () {},
                    loading: (action) => isLoading = true,
                  );

                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(strokeWidth: 2.0),
                    );
                  }

                  return PrimaryButton(
                    text: (widget.bank != null ? 'Update Bank Account' : 'Add Bank Account').toUpperCase(),
                    elevation: 0,
                    padding: const EdgeInsets.all(12.0),
                    onPressed: () {
                      if (_micrCodeController.text.isEmpty) {
                        showErrorDialog(context, 'Please enter MICR code. If you do not have MICR then enter last 6 digits of IFSC code');
                      } else {
                        final bank = CustomerBank(
                          id: widget.bank?.id ?? '',
                          bankName: _bankName ?? '',
                          bankId: '',
                          branchName: _branchNameController.text,
                          ifscCode: _ifscCode.text,
                          accountType: _actType ?? '',
                          accountNumber: _actNumberController.text,
                          nameOnBankAccount: _nameController.text,
                          isValidated: false,
                          micrCode: int.tryParse(_micrCodeController.text),
                        );

                        BlocProvider.of<NewLoanActionCubit>(context)
                            .addNewBank(widget.loanId, bank);
                      }
                    },
                  );
                },
              ),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('CANCEL'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _fetchBankDetails(BuildContext context, String ifscCode) {
    BlocProvider.of<NewLoanActionCubit>(context)
        .fetchBankDetailsByIfsc(ifscCode);
  }

  Widget _buildBanksDropdown(List<Simple> banks) {
    return ChoiceChoiceListWidget(
      key: _bankName != null ? ObjectKey(_bankName) : null,
      title: 'Bank',
      items: banks,
      defaultSelection: _bankName,
      onSelected: (value) {
        _bankName = value;
      },
    );
  }
}
