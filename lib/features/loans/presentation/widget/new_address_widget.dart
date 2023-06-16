import 'package:ez_flutter/features/loans/domain/entity/customer_address.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/states/states_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/choice_chip_list_widget.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/model/simple.dart';
import 'package:ez_flutter/shared/widget/go_back.dart';
import 'package:ez_flutter/shared/widget/input_field.dart';
import 'package:ez_flutter/shared/widget/loading_widget.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewAddressWidget extends StatefulWidget {
  const NewAddressWidget({Key? key}) : super(key: key);

  @override
  State<NewAddressWidget> createState() => _NewAddressWidgetState();
}

class _NewAddressWidgetState extends State<NewAddressWidget> {
  late TextEditingController _pAdl1Controller;
  late TextEditingController _pAdl2Controller;
  late TextEditingController _pPincodeController;
  late TextEditingController _pCityController;
  String? _pState;
  late TextEditingController _cAdl1Controller;
  late TextEditingController _cAdl2Controller;
  late TextEditingController _cPincodeController;
  late TextEditingController _cCityController;
  String? _cState;
  bool _curAddressSameAsPerAddress = true;

  @override
  void initState() {
    super.initState();

    _pAdl1Controller = TextEditingController();
    _pAdl2Controller = TextEditingController();
    _pPincodeController = TextEditingController();
    _pCityController = TextEditingController();

    _cAdl1Controller = TextEditingController();
    _cAdl2Controller = TextEditingController();
    _cPincodeController = TextEditingController();
    _cCityController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const GoBack(),
        title: Text(
          'Add Permanent Address',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: BlocListener<NewLoanActionCubit, NewLoanActionState>(
        listener: (ctx, state) {
          state.maybeWhen(
              orElse: () {},
              success: (_, __) => Navigator.of(context).pop(true),
              failure: (action, f) {
                if (action == NewLoanAction.addAddress) {
                  f.maybeWhen(
                    invalidFieldValue: (error) => showErrorDialog(context, error ?? 'Please select all values'),
                    serverFailure: (code, error) => showErrorDialog(context, error),
                    orElse: () => showErrorDialog(context, 'Uh oh. Something went wrong'),
                  );
                }
              });
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Permanent Address'.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              InputField(
                hintText: 'Address Line 1',
                controller: _pAdl1Controller,
                maxLength: 64,
              ),
              const SizedBox(height: 6),
              InputField(
                hintText: 'Address Line 2',
                controller: _pAdl2Controller,
                maxLength: 64,
              ),
              const SizedBox(height: 6),
              InputField(
                hintText: 'Pincode',
                controller: _pPincodeController,
                textInputType: TextInputType.number,
                maxLength: 6,
              ),
              const SizedBox(height: 6),
              InputField(
                hintText: 'City',
                controller: _pCityController,
                maxLength: 64,
              ),
              const SizedBox(height: 6),
              BlocBuilder<StatesCubit, StatesState>(
                builder: (ctx, state) {
                  return state.when(
                    initial: () => const LoadingWidget(),
                    loading: () => const LoadingWidget(),
                    success: (states) {
                      return _buildBanksDropdown(states, (selected) {
                        _pState = selected;
                      });
                    },
                    failure: (f) => _buildBanksDropdown(<Simple>[], (_) {}),
                  );
                },
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: _curAddressSameAsPerAddress,
                title: Text(
                  'Current Address'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: const Text('Same as Permanent Address?'),
                onChanged: (value) {
                  setState(() {
                    _curAddressSameAsPerAddress = !_curAddressSameAsPerAddress;
                    if (_curAddressSameAsPerAddress) {
                      _cAdl1Controller.text = _pAdl1Controller.text;
                      _cAdl2Controller.text = _pAdl1Controller.text;
                      _cPincodeController.text = _pPincodeController.text;
                      _cCityController.text = _pCityController.text;
                      _cState = _pState;
                    } else {
                      _cAdl1Controller.text = '';
                      _cAdl2Controller.text = '';
                      _cPincodeController.text = '';
                      _cCityController.text = '';
                      _cState = null;
                    }
                  });
                },
              ),
              const SizedBox(height: 6),
              if (_curAddressSameAsPerAddress == false) ...[
                InputField(
                  hintText: 'Address Line 1',
                  controller: _cAdl1Controller,
                  maxLength: 64,
                ),
                const SizedBox(height: 6),
                InputField(
                  hintText: 'Address Line 2',
                  controller: _cAdl2Controller,
                  maxLength: 64,
                ),
                const SizedBox(height: 6),
                InputField(
                  hintText: 'Pincode',
                  controller: _cPincodeController,
                  textInputType: TextInputType.number,
                  maxLength: 6,
                ),
                const SizedBox(height: 6),
                InputField(
                  hintText: 'City',
                  controller: _cCityController,
                  maxLength: 64,
                ),
                const SizedBox(height: 6),
                BlocBuilder<StatesCubit, StatesState>(
                  builder: (ctx, state) {
                    return state.when(
                      initial: () => const LoadingWidget(),
                      loading: () => const LoadingWidget(),
                      success: (states) {
                        return _buildBanksDropdown(
                          states,
                          (selected) {
                            _cState = selected;
                          },
                        );
                      },
                      failure: (f) => _buildBanksDropdown(<Simple>[], (_) {}),
                    );
                  },
                ),
              ],
              const SizedBox(height: 6),
              BlocBuilder<NewLoanActionCubit, NewLoanActionState>(
                builder: (ctx, state) {
                  final isLoading = state.maybeWhen(
                    orElse: () => false,
                    loading: (_) => true,
                  );

                  return PrimaryButton(
                    text: isLoading ? 'Please wait...' : 'SUBMIT',
                    onPressed: isLoading
                        ? null
                        : () {
                            final preEnqId =
                                BlocProvider.of<NewLoanCubit>(context)
                                    .state
                                    .form!
                                    .id;
                            final permanentAddress = CustomerAddress(
                              id: '',
                              addressLine1: _pAdl1Controller.text,
                              addressLine2: _pAdl2Controller.text,
                              postalCode: _pPincodeController.text,
                              cityName: _pCityController.text,
                              countryName: Constants.indiaCountryCode,
                              stateName: _pState ?? '',
                            );
                            final currentAddress = CustomerAddress(
                              id: '',
                              addressLine1: _cAdl1Controller.text,
                              addressLine2: _cAdl2Controller.text,
                              postalCode: _cPincodeController.text,
                              cityName: _cCityController.text,
                              countryName: Constants.indiaCountryCode,
                              stateName: _cState ?? '',
                            );
                            BlocProvider.of<NewLoanActionCubit>(context).addAddress(
                              preEnqId,
                              _curAddressSameAsPerAddress,
                              permanentAddress,
                              currentAddress,
                            );
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pAdl1Controller.dispose();
    _pAdl2Controller.dispose();
    _pPincodeController.dispose();
    _pCityController.dispose();
    _cAdl1Controller.dispose();
    _cAdl2Controller.dispose();
    _cPincodeController.dispose();
    _cCityController.dispose();
  }

  Widget _buildBanksDropdown(
      List<Simple> banks, void Function(String) onSelected) {
    return ChoiceChoiceListWidget(
      title: 'State',
      items: banks,
      onSelected: onSelected,
    );
  }
}
