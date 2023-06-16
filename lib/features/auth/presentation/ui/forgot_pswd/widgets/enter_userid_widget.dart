import 'package:ez_flutter/features/auth/presentation/bloc/forgot_pswd/forgot_pswd.dart';
import 'package:ez_flutter/features/auth/presentation/widgets/input_filed2.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterUserIdWidget extends StatefulWidget {
  const EnterUserIdWidget({Key? key}) : super(key: key);

  @override
  State<EnterUserIdWidget> createState() => _EnterUserIdWidgetState();
}

class _EnterUserIdWidgetState extends State<EnterUserIdWidget> {
  late TextEditingController _username;
  @override
  void initState() {
    super.initState();
    final name = BlocProvider.of<ForgotPswdCubit>(context).state.username;
    _username = TextEditingController(text: name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Text(
          'Please enter your User ID',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 16,
              ),
        ),
        VerticalSpacing.large,
         InputFiled2(
          borderRadius: 12,
          prefixIcon: const Icon(Icons.person),
          showLabel: true,
          applyFormatters: false,
          controller: _username,
          labelText: 'Enter your User ID',
          title: 'Enter your User ID',
          maxLength: null,
        ),
        VerticalSpacing.large,
        PrimaryButton(
          text: 'SUBMIT',
          onPressed: () {
            BlocProvider.of<ForgotPswdCubit>(context).checkIsUserExists(_username.text);
          },
        ),
      ],
    );
  }
}
