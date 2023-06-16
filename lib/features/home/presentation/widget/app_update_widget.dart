import 'package:ez_flutter/features/auth/presentation/bloc/blocs.dart';
import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:ez_flutter/shared/widget/app_update_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppUpdateWidget extends StatefulWidget {
  const AppUpdateWidget({Key? key}) : super(key: key);

  @override
  _AppUpdateWidgetState createState() => _AppUpdateWidgetState();
}

class _AppUpdateWidgetState extends State<AppUpdateWidget> {
  bool _showBanner = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppUpdateCubit, AppUpdateState>(
      listener: (ctx, state) {
        state.maybeWhen(
          failure: (f) {
            BlocProvider.of<AuthCubit>(context).loggedOut();
          },
          orElse: () {},
          updateAvailable: () {
            if (kReleaseMode) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) => const AppUpdateDialog(),
              );
            }
          },
        );
      },
      child: _showBanner ? _buildBanner() : null,
    );
  }

  Widget _buildBanner() {
    return MaterialBanner(
      leading: const CircleAvatar(child: Icon(Icons.system_update)),
      content: const Text('App update is available.'),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              _showBanner = false;
            });
          },
          child: const Text('Later'),
        ),
        TextButton(
          onPressed: () => openAppInStore(),
          child: const Text('Update'),
        ),
      ],
    );
  }
}
