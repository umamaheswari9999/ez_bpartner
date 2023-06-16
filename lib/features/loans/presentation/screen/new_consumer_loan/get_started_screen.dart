import 'package:dartz/dartz.dart' as dartz;
import 'package:ez_flutter/constants/templates.dart';
import 'package:ez_flutter/ctxt_utils/overlay.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/loans/data/model/ocrpan.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner_add/bpartner_add_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/ocr_pan_validation/ocr_pan_validation_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/pan_validation/pan_validation_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/choice_chip_list_widget.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/bpAdd_selection.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/bpartner_selection.dart';
import 'package:ez_flutter/features/loans/presentation/widget/utils/screen_utils.dart';
import 'package:ez_flutter/local/static_data.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/usecases/aadhar_inp_formatter.dart';
import 'package:ez_flutter/shared/widget/input_field.dart';
import 'package:ez_flutter/shared/widget/pan_input_field.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';

class NewConsumerLoan extends StatefulWidget {
  const NewConsumerLoan({Key? key}) : super(key: key);

  @override
  State<NewConsumerLoan> createState() => _NewConsumerLoanState();
}

class _NewConsumerLoanState extends State<NewConsumerLoan> {
  final TextEditingController _panCotroller = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _cnfAadharNumber = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  late User user;
  String? bpartnerId;
  String? bpartnerName;
  String? bpartnerAddId;
  String? bpartnerAddName;
  late LoadingOverlay overlay;
  DateTime? _dob;
  String? _gender;
  bool _isFirstTimeCustomer = false;
  bool _loanExists = false;

  bool _shouldDisableContinue = false;
  @override
  void initState() {
    super.initState();
    user = locator.get<User>();
    bpartnerId = user.businessPartnerId;
    bpartnerName = user.businessPartnerName;
    bpartnerAddId = user.businessPartnerAddressId;
    bpartnerAddName = user.businessPartnerAddressName;
    overlay = LoadingOverlay.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<PanValidationCubit, PanValidationState>(
            listener: (context, state) {
              state.maybeWhen(
                loading: () => overlay.show(),
                success: (r) {
                  overlay.hide();
                  final response = r;
                  if (response.value1) {
                    setState(() {
                      _nameController.text = response.value2 ?? '';
                    });
                    BlocProvider.of<NewLoanActionCubit>(context)
                        .checkIfLoanExists(
                            _panCotroller.text, bpartnerId, bpartnerAddId);
                    showSnackbar(context, 'Valid PAN Number');
                  } else {
                    setState(() {
                      _dob = null;
                      _gender = null;
                      _nameController.clear();
                      _mobileController.clear();
                      _aadhaarController.clear();
                      _cnfAadharNumber.clear();
                      _dobController.clear();
                    });
                    showSnackbar(context, 'Inalid PAN Number');
                  }
                },
                failure: (failure) {

                  overlay.hide();
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<OcrPanValidationCubit, OcrPanValidationState>(
            listener: (context, state) {
              state.maybeWhen(
                loading: () => overlay.show(),
                success: (details) {
                  BlocProvider.of<NewLoanActionCubit>(context)
                      .checkIfLoanExists(
                          details.idNo, bpartnerAddId, bpartnerAddId);
                  setState(() {
                    _nameController.text = details.name;
                    if (details.isPAN) {
                      _panCotroller.text = details.idNo;
                      final panDOB =
                          DateFormat('dd/MM/yyyy').parse(details.dob!);
                      _dobController.text =
                          DateFormat('dd-MM-yyyy').format(panDOB);
                      _dob = panDOB;
                    } else {
                      final res = AadharNumberFormatter().formatEditUpdate(
                        _aadhaarController.value,
                        TextEditingValue(text: details.idNo),
                      );
                      _aadhaarController.text = res.text;
                      _cnfAadharNumber.text = res.text;
                      _gender = details.getGender();
                    }
                  });
                  overlay.hide();
                },
                failure: (failure) {
                  overlay.hide();
                  failure.maybeWhen(
                      apiFailure: (message) => showSnackbar(context, message),
                      orElse: () => showSnackbar(
                          context, 'OOPS...! Something went wrong..!'));
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<NewLoanActionCubit, NewLoanActionState>(
            listener: (ctx, state) {
              state.maybeWhen(
                success: (action, data) {
                  if (action == NewLoanAction.existingLoanCheck) {
                    if (data != null && data['data'] != null) {
                      final data2 = data['data']
                          as dartz.Tuple2<PreEnquiryForm?, Customer?>;
                      final preEnquiry = data2.value1;
                      final customer = data2.value2;

                      BlocProvider.of<NewLoanCubit>(context)
                          .setCustomer(customer);

                      if (customer != null && (customer.locations.isNotEmpty)) {
                        final perPostalCode = customer
                            .locations.first.permanentAddress?.postalCode;
                        final resPostalCode =
                            customer.locations.first.currentAddress?.postalCode;

                        if ((perPostalCode != null &&
                                perPostalCode.isNotEmpty) ||
                            (resPostalCode != null &&
                                resPostalCode.isNotEmpty)) {
                          BlocProvider.of<PincodeHoldCheckCubit>(context)
                              .checkIfOnHold(perPostalCode ?? resPostalCode!);
                        }
                      }

                      if (preEnquiry != null) {
                        _dobController.text = preEnquiry.dob != null
                            ? DateFormat('dd-MM-yyyy')
                                .format(DateTime.parse(preEnquiry.dob!))
                            : '';
                        _mobileController.text = preEnquiry.mobileNumber ?? '';
                        BlocProvider.of<NewLoanCubit>(context)
                            .setLoanDetails(preEnquiry);

                        setState(() {
                          _loanExists = true;
                          _isFirstTimeCustomer = false;
                        });
                      } else if (customer != null) {
                        setState(() {
                          final res = AadharNumberFormatter().formatEditUpdate(
                            _aadhaarController.value,
                            TextEditingValue(
                                text: customer.master.aadharNumber ?? ''),
                          );
                          if (res.text.isNotEmpty) {
                            _aadhaarController.text = res.text;
                            _cnfAadharNumber.text = res.text;
                          }
                          _nameController.text = customer.master.name;
                          _mobileController.text = customer.master.mobile ?? '';
                          if (customer.master.dob != null) {
                            final originalDateFormat = DateFormat('yyyy-MM-dd');
                            final uiDateFormat = DateFormat('dd-MM-yyyy');
                            final dateOfBirth = DateFormat("yyyy-MM-dd")
                                .parse(customer.master.dob!);
                            _dob = dateOfBirth;
                            _dobController.text = uiDateFormat.format(
                                originalDateFormat.parse(customer.master.dob!));
                          }
                          _mobileController.text = customer.master.mobile ?? '';
                          _gender = customer.master.gender;
                          _loanExists = false;
                          _isFirstTimeCustomer = true;
                        });
                      } else {
                        setState(() {
                          _loanExists = false;
                          _isFirstTimeCustomer = true;
                        });
                      }
                    } else {
                      setState(() {
                        _loanExists = false;
                        _isFirstTimeCustomer = true;
                      });
                    }
                  } else if (action == NewLoanAction.createBasicPreEnquiry) {
                    if (data != null && data['loan'] != null) {
                      final data2 = data['loan'] as PreEnquiryForm;
                      _goToStepDecider(data2);
                    }
                  }
                },
                failure: (_, f) {
                  f.maybeWhen(
                    unAuthorized: () => showSnackbar(context, 'Unauthorized'),
                    noInternet: () =>
                        showSnackbar(context, 'Please check your internet'),
                    unknownFailure: () => showSnackbar(
                        context, 'Uh oh. some unknown issue occurred'),
                    serverFailure: (code, message) =>
                        showSnackbar(context, message),
                    invalidFieldValue: (message) =>
                        showSnackbar(context, message!),
                    orElse: () => showSnackbar(context, 'Something went wrong'),
                  );
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<PincodeHoldCheckCubit, PincodeHoldCheckState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (isOnHold) {
                  if (isOnHold) {
                    showErrorDialog(context, Templates.pincodeHoldMessage);
                    setState(() {
                      _shouldDisableContinue = true;
                      _panCotroller.clear();
                      _mobileController.clear();
                      _aadhaarController.clear();
                      _cnfAadharNumber.clear();
                      _gender = '';
                      _nameController.clear();
                      _dobController.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    });
                  } else {
                    setState(() {
                      _shouldDisableContinue = false;
                    });
                  }
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Let\'s Get Started',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Enter following information to proceed further',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: null,
                  ),
                ),
                if (user.businessPartnerAddressId == null) ...[
                  const SizedBox(height: 10),
                  BPartnerSelection(
                    inital: bpartnerName,
                    onBPSelection: (bpartner) {
                      setState(() {
                        bpartnerName = bpartner.name;
                        bpartnerId = bpartner.id;
                        bpartnerAddId = null;
                        bpartnerAddName = null;
                      });
                      BlocProvider.of<BpartnerAddCubit>(context).fetchInitial(bpartner.id);
                    },
                  ),
                  const SizedBox(height: 10),
                  BPAddressSelection(
                    initalAddress: bpartnerAddName,
                    bpartnerId: bpartnerId,
                    onBPAddSelection: (address) {
                      setState(() {
                        bpartnerAddName = address.name;
                        bpartnerAddId = address.id;
                      });
                    },
                  ),
                ],
                const SizedBox(height: 6),
                PANInputFieldWidget(
                  controller: _panCotroller,
                  hintText: 'PAN',
                  maxLength: 10,
                  title: 'PAN',
                  prefixIcon: const Icon(FeatherIcons.code),
                  suffixIcon: InkWell(
                    onTap: _startAttachmentSelectionFlow,
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // color: Colors.grey.shade100,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'SCAN PAN',
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.document_scanner_outlined)
                        ],
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.length == 10) {
                      BlocProvider.of<PanValidationCubit>(context)
                          .isValidPANNumber(_panCotroller.text);
                    } else {
                      setState(() {
                        _loanExists = false;
                        _dob = null;
                        _gender = null;
                        _nameController.clear();
                        _mobileController.clear();
                        _aadhaarController.clear();
                        _dobController.clear();
                      });
                    }
                  },
                  onSubmit: (_) {},
                ),
                const SizedBox(height: 12),
                if (_isFirstTimeCustomer) ...[
                  InputField(
                    controller: _nameController,
                    hintText: 'Customer Name',
                    prefixIcon: const Icon(FeatherIcons.code),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  ChoiceChoiceListWidget(
                    key: ObjectKey(_gender),
                    title: 'Gender',
                    items: StaticData.genders,
                    dropdownViewStyle: false,
                    onSelected: (value) => _gender = value,
                    defaultSelection: _gender,
                  ),
                  const SizedBox(height: 12),
                  InputField(
                    obsecuretext: true,
                    controller: _aadhaarController,
                    hintText: 'Aadhaar Number',
                    prefixIcon: const Icon(FeatherIcons.code),
                    onChanged: (value) {},
                    maxLength: 14,
                    formmater: [
                      FilteringTextInputFormatter.digitsOnly,
                      AadharNumberFormatter()
                    ],
                    textInputType: TextInputType.number,
                    suffixIcon: InkWell(
                      onTap: _startAttachmentSelectionFlow,
                      child: Container(
                        margin: const EdgeInsets.all(1),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // color: Colors.grey.shade100,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'SCAN AADHAR',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            const Icon(Icons.document_scanner_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  InputField(
                    controller: _cnfAadharNumber,
                    formmater: [
                      FilteringTextInputFormatter.digitsOnly,
                      AadharNumberFormatter()
                    ],
                    hintText: 'Confirm Aadhaar Number',
                    prefixIcon: const Icon(FeatherIcons.code),
                    onChanged: (value) {},
                    maxLength: 14,
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                ],
                InputField(
                  controller: _dobController,
                  hintText: 'dd-mm-yyyy',
                  prefixIcon: const Icon(FeatherIcons.calendar),
                  onChanged: (value) {},
                  onTap: () {
                    showDatePicker(
                      context: context,
                      fieldHintText: 'dd-mm-yyyy',
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now()
                          .subtract(const Duration(days: 365 * 80)),
                      lastDate: DateTime.now(),
                    ).then((value) {
                      if (value != null) {
                        _dobController.text =
                            DateFormat('dd-MM-yyyy').format(value);
                        _dob = value;
                      }
                    });
                  },
                  readOnly: true,
                ),
                const SizedBox(height: 12),
                InputField(
                  controller: _mobileController,
                  hintText: 'Mobile Number',
                  prefixIcon: const Icon(FeatherIcons.phone),
                  onChanged: (value) {},
                  maxLength: 10,
                  textInputType: TextInputType.number,
                ),
                if (_loanExists) ...[
                  const SizedBox(height: 12),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.all(16.0),
                    tileColor: Theme.of(context).colorScheme.secondary,
                    leading: const Icon(FeatherIcons.alertTriangle),
                    title: Text(
                        'There is already a loan in progress with ${_panCotroller.text}. Do you want to continue?'),
                  ),
                ],
                const SizedBox(height: 24),
                BlocBuilder<NewLoanActionCubit, NewLoanActionState>(
                  builder: (ctx, state) {
                    return state.maybeWhen(
                      loading: (action) => const Center(
                          child: CircularProgressIndicator.adaptive()),
                      orElse: () => _buildContinueButton(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startAttachmentSelectionFlow() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (!kIsWeb) ...[
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      _closeBottomSheet();
                      final selectedFile = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (selectedFile != null) {
                        final size =
                            (await File(selectedFile.path).readAsBytes())
                                .length;
                        PlatformFile pfile = PlatformFile(
                          bytes: await selectedFile.readAsBytes(),
                          name: 'PAN',
                          size: size,
                        );
                        if (!mounted) return;
                        BlocProvider.of<OcrPanValidationCubit>(context)
                            .ocrPANValidation(pfile);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.camera),
                          SizedBox(height: 8),
                          Text('Camera')
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      _closeBottomSheet();
                      final selectedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (selectedFile == null) return;
                      final size =
                          (await File(selectedFile.path).readAsBytes()).length;
                      PlatformFile pfile = PlatformFile(
                        bytes: await selectedFile.readAsBytes(),
                        name: 'PAN',
                        size: size,
                      );
                      if (!mounted) return;
                      BlocProvider.of<OcrPanValidationCubit>(context)
                          .ocrPANValidation(pfile);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.image),
                          SizedBox(height: 8),
                          Text('Gallery')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              Expanded(
                child: InkWell(
                  onTap: () async {
                    _closeBottomSheet();
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowMultiple: false,
                      withData: true,
                      allowedExtensions: ["jpg", "png", "jpeg"],
                    );
                    if (!mounted) return;
                    if (result != null || (result!.files.isNotEmpty)) {
                      BlocProvider.of<OcrPanValidationCubit>(context)
                          .ocrPANValidation(result.files.first);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(Icons.smartphone),
                        SizedBox(height: 8),
                        Text('Phone'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _closeBottomSheet() => Navigator.of(context).pop();

  void _goToStepDecider(PreEnquiryForm data2) {
    Navigator.of(context).pop(true);
    openLoanStepDecider(
      context,
      data2.preEnquiryNumber,
      data2.pan ?? data2.poiNumber ?? '',
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return PrimaryButton(
      text: 'CONTINUE',
      onPressed: _shouldDisableContinue
          ? null
          : () {
              final newLoanState = BlocProvider.of<NewLoanCubit>(context).state;
              final form = newLoanState.form;

              final pan = _panCotroller.value.text;
              final customerName = _nameController.value.text;
              final mobile = _mobileController.value.text;
              final aadhaar = _aadhaarController.value.text;
              final cnfaadhar = _cnfAadharNumber.value.text;

              // No pre enquiry exists with that pan number
              if (form == null) {
                BlocProvider.of<NewLoanActionCubit>(context)
                    .createBasicPreEnquiry(
                  pan,
                  customerName,
                  aadhaar,
                  cnfaadhar,
                  _dob,
                  mobile,
                  _gender,
                  bpartnerId,
                  bpartnerAddId,
                  customerRefNo: newLoanState.customer?.master.id,
                  customer: newLoanState.customer,
                );
              } else {
                _goToStepDecider(form);
              }
            },
    );
  }
}
