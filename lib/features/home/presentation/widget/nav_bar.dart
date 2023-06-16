import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/home/presentation/bloc/app_scrn/app_scrn_cubit.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final _idxToScreens = {
    0: AppScreen.home,
    1: AppScreen.reports,
    2: AppScreen.loans,
  };
  final screensToIndex = const {
    AppScreen.home: 0,
    AppScreen.reports: 1,
    AppScreen.loans: 2,
  };

  @override
  Widget build(BuildContext context) {
    final user = locator.get<User>();
    return BlocBuilder<AppScreenCubit, AppScreen>(
      builder: (ctx, screen) {
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.secondary,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: screen.getIndex,
          onTap: (int index) {
            if (index == 1 && user.isManager) {
              BlocProvider.of<AppScreenCubit>(context).onScreenChanged(AppScreen.reports);
            } else if(index == 1 && !user.isManager){
              BlocProvider.of<AppScreenCubit>(context).onScreenChanged(AppScreen.loans);
            } else {
              BlocProvider.of<AppScreenCubit>(context).onScreenChanged(_idxToScreens[index]!);
            }
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              activeIcon: Icon(Icons.home,color: Colors.white),
            ),
            if (user.isManager) ...[
              const BottomNavigationBarItem(
                icon: Icon(FeatherIcons.fileText),
                label: 'Reports',
                activeIcon: Icon(FeatherIcons.fileText,color: Colors.white),
              ),
            ],
            const BottomNavigationBarItem(
              icon: Icon(Icons.query_stats_outlined),
              label: 'Loan Status',
              activeIcon: Icon(Icons.query_stats_outlined,color: Colors.white),
            )
          ],
        );
      },
    );
  }
}
