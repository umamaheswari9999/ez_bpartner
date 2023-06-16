import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/home/presentation/bloc/app_scrn/app_scrn_cubit.dart';
import 'package:ez_flutter/features/home/presentation/bloc/status_count/status_count_cubit.dart';
import 'package:ez_flutter/features/home/presentation/screen/home_screen.dart';
import 'package:ez_flutter/features/home/presentation/widget/home_app_bar.dart';
import 'package:ez_flutter/features/home/presentation/widget/nav_bar.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner/bpartner_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner_add/bpartner_add_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/ocr_pan_validation/ocr_pan_validation_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/pan_validation/pan_validation_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/screen/new_consumer_loan/get_started_screen.dart';
import 'package:ez_flutter/features/profile/presentation/profile_screen.dart';
import 'package:ez_flutter/features/loans/presentation/loan_status_scrn.dart';
import 'package:ez_flutter/features/reports/presentation/bloc/download_report/download_reports.dart';
import 'package:ez_flutter/features/reports/presentation/reports_scrn.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/widget/app_update_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = locator.get<User>();
    return Scaffold(
      appBar: null,
      endDrawer: const ProfileScreen(),
      backgroundColor: const Color(0xffeceff5),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AppUpdateCubit, AppUpdateState>(
            listener: (context, state) {
              state.maybeWhen(
                failure: (f) {
                  BlocProvider.of<AuthCubit>(context).loggedOut();
                },
                orElse: () {},
                updateAvailable: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (ctx) => const AppUpdateDialog(),
                  );
                },
              );
            },
          ),
          BlocListener<DownloadReportCubit, DownloadReportState>(
            listener: (context, state) {
              state.maybeWhen(
                loading: (action) => showSnackbar(context,'Generating report..! Please wait for a while...'),
                success: (action, text) => showSnackbar(context, text),
                orElse: () {},
              );
            },
          ),
        ],
        child: Column(
          children: [
            const HomeAppBar(),
            Expanded(
              child: BlocBuilder<AppScreenCubit, AppScreen>(
                builder: (context, state) {
                  switch (state) {
                    case AppScreen.home:
                      return const HomeScreen();
                    case AppScreen.loans:
                      return const LoanStatusScreen();
                    case AppScreen.reports:
                      return const ReportsScrn();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: user.isManager
          ? null
          : FloatingActionButton.extended(
              label: const Text(
                'NEW LOAN',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (ctx) => locator.get<NewLoanActionCubit>()),
                        BlocProvider(
                            create: (ctx2) => locator.get<NewLoanCubit>()),
                        BlocProvider(
                            create: (ctx2) =>
                                locator.get<PanValidationCubit>()),
                        BlocProvider(
                            create: (ctx2) =>
                                locator.get<OcrPanValidationCubit>()),
                        BlocProvider(
                            create: (ctx2) =>
                                locator.get<PincodeHoldCheckCubit>()),
                        BlocProvider(
                            create: (ctx2) => locator.get<BpartnerCubit>()),
                        BlocProvider(
                            create: (ctx2) => locator.get<BpartnerAddCubit>()),
                      ],
                      child: const NewConsumerLoan(),
                    ),
                  ),
                );
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
    );
  }
}
