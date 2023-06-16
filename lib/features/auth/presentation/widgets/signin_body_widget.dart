import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/forgot_pswd/forgot_pswd.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/lost_userid/lost_userid.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:ez_flutter/features/auth/presentation/ui/forgot_pswd/forgot_pswd_scrn.dart';
import 'package:ez_flutter/features/auth/presentation/ui/lost_id/number_veri_scrn.dart';
import 'package:ez_flutter/features/auth/presentation/widgets/app_version_text.dart';
import 'package:ez_flutter/features/auth/presentation/widgets/team_help_widget.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBodyWidget extends StatefulWidget {
  const SignInBodyWidget({Key? key}) : super(key: key);

  @override
  State<SignInBodyWidget> createState() => _SignInBodyWidgetState();
}

class _SignInBodyWidgetState extends State<SignInBodyWidget> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;

  void togglePasswordDisplay() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildImage(),
        Expanded(
          child: Container(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Theme.of(context).colorScheme.primary.withAlpha(60),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                  ),
                  VerticalSpacing.large,
                  _buildUserNameField(),
                  _buildPasswordField(),
                  VerticalSpacing.large,
                  _buildSignInButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLostUserId(),
                      _buildForgotPswd(),
                    ],
                  ),
                  VerticalSpacing.large,
                  const AppVersionText(),
                  VerticalSpacing.large,
                ],
              ),
            ),
          ),
        ),
        const TeamHelpWidget(),
      ],
    );
  }

  Widget _buildImage() {
    return SafeArea(
      child: Image.asset(
        ImagePaths.logo,
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _buildUserNameField() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        side: BorderSide(
          color: Colors.grey.shade100,
        ),
      ),
      elevation: 4,
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: TextField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          contentPadding: EdgeInsets.all(16.0),
          hintText: "Username",
          prefixIcon: Icon(FeatherIcons.user),
          prefixIconColor: Colors.blueGrey,
        ),
        autocorrect: false,
        keyboardType: TextInputType.text,
        controller: _userNameController,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        side: BorderSide(
          color: Colors.grey.shade100,
        ),
      ),
      elevation: 4,
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: TextField(
        controller: _passwordController,
        obscureText: !_showPassword,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          prefixIcon: const Icon(FeatherIcons.key),
          suffixIcon: InkWell(
            onTap: togglePasswordDisplay,
            child: Icon(
              FeatherIcons.eye,
              color: _showPassword ? Colors.red : Colors.blueGrey,
            ),
          ),
          hintText: "Password",
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        autocorrect: false,
      ),
    );
  }

  Widget _buildForgotPswd() {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: _navigateToFgpswd,
        child: Text(
          'Forgot password?',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.blueAccent,
              ),
        ),
      ),
    );
  }

  void _navigateToFgpswd() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => locator.get<ForgotPswdCubit>(),
          child: const ForgotPswdScrn(),
        ),
      ),
    )
        .then((value) {
      if (value == true) {
        _navigateToLostIDSScrn();
      }
    });
  }

  TextButton _buildLostUserId() {
    return TextButton(
      onPressed: _navigateToLostIDSScrn,
      child: Text(
        'Lost User ID?',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.blueAccent,
            ),
      ),
    );
  }

  void _navigateToLostIDSScrn() {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => locator.get<LostUseridCubit>(),
          child: const NumberVerifScrn(),
        ),
      ),
    )
        .then((value) {
      if (value == null) return;
      final res = value as dartz.Tuple2<bool?, bool?>;
      if (res.value2 == true) {
        _navigateToFgpswd();
      }
    });
  }

  Widget _buildSignInButton() {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        final isloading = state.maybeWhen(
          orElse: () => false,
          loading: () => true,
        );

        return ElevatedButton(
          onPressed: isloading ? null : () => _signIn(),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(4),
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            shadowColor: const Color(0x7040BFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                isloading ? 'Please Wait..!' : "Sign In".toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _signIn() {
    BlocProvider.of<SignInCubit>(context).signIn(
      _userNameController.text,
      _passwordController.text,
    );
  }
}
