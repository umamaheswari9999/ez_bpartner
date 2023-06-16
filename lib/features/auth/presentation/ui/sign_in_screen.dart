import 'package:ez_flutter/features/auth/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/auth/presentation/widgets/signin_body_widget.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: BlocListener<SignInCubit, SignInState>(
        listener: (BuildContext ctx, state) {
          state.maybeWhen(
            orElse: () {},
            goToHomePage: () {
              BlocProvider.of<AuthCubit>(context).checkUserSession();
            },
            failure: (error) {
              error.maybeWhen(
                serverFailure: (code, message) => showSnackbar(context, message),
                invalidFieldValue: (message) => showSnackbar(context, message ?? ''),
                unAuthorized: () => showSnackbar(context, 'Invalid username/password'),
                noInternet: () => showSnackbar(context, 'Please check your internet'),
                unknownFailure: () => showSnackbar(context, 'Uh oh. some unknown issue occurred'),
                orElse: () => showSnackbar(context, 'Something went wrong'),
              );
            },
          );
        },
        child: const SignInBodyWidget(),
      ),
    );
  }
}
