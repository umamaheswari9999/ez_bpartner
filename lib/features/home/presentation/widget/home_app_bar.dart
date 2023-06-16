import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/screen/loans_screen.dart';
import 'package:ez_flutter/features/notifications/presentation/bloc/notification_bloc/notification_cubit.dart';
import 'package:ez_flutter/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loan_search_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: AppColors.lightGrey,
      backgroundColor: Colors.white,
      leadingWidth: 250,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(ImagePaths.logo),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => BlocProvider(
                    child: const NotificationsScreen(),
                    create: (ctx) =>
                        locator.get<NotificationsCubit>()..fetchInitial(),
                  ),
                ),
              );
            },
            icon: const Icon(FeatherIcons.bell),
          ),
        ),

        Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IconButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            icon: const Icon(FeatherIcons.user),
          ),
        ),
      ],
    );
  }
}
