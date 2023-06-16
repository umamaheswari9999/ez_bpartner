import 'package:ez_flutter/features/auth/presentation/bloc/forgot_pswd/forgot_pswd.dart';
import 'package:ez_flutter/features/auth/presentation/widgets/input_filed2.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPSWDWidget extends StatefulWidget {
  const ResetPSWDWidget({Key? key}) : super(key: key);

  @override
  State<ResetPSWDWidget> createState() => _ResetPSWDWidgetState();
}

class _ResetPSWDWidgetState extends State<ResetPSWDWidget> {
  late TextEditingController _pswd;
  late TextEditingController _cnfpswd;
  bool _showPassword = false;
  bool _showCNFPassword = false;
  @override
  void initState() {
    super.initState();
    _pswd = TextEditingController();
    _cnfpswd = TextEditingController();
  }

  void togglePasswordDisplay() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void toggleCNFPasswordDisplay() {
    setState(() {
      _showCNFPassword = !_showCNFPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<ForgotPswdCubit>(context).emitOTPScrn();
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VerticalSpacing.large,
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Reset Your Password..!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          VerticalSpacing.large,
          InputFiled2(
            obsecuretext: !_showPassword,
            hintText: 'Password',
            title: 'Password',
            controller: _pswd,
            prefixIcon: const Icon(FeatherIcons.key),
            suffixWidget: InkWell(
              onTap: () => togglePasswordDisplay(),
              child: Icon(
                FeatherIcons.eye,
                color: _showPassword ? Colors.red : Colors.blueGrey,
              ),
            ),
          ),
          VerticalSpacing.medium,
          InputFiled2(
            prefixIcon: const Icon(FeatherIcons.key),
            obsecuretext: !_showCNFPassword,
            hintText: 'Confirm Password',
            title: 'Confirm Password',
            controller: _cnfpswd,
            suffixWidget: InkWell(
              onTap: () => toggleCNFPasswordDisplay(),
              child: Icon(
                FeatherIcons.eye,
                color: _showCNFPassword ? Colors.red : Colors.blueGrey,
              ),
            ),
          ),
          VerticalSpacing.large,
          PrimaryButton(
            text: 'UPDATE',
            onPressed: () {
              BlocProvider.of<ForgotPswdCubit>(context)
                  .changePSWD(_pswd.text, _cnfpswd.text);
            },
          ),
        ],
      ),
    );
  }
}
