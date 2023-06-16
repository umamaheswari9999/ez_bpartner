import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/auth/presentation/ui/ez_splash_screen.dart';
import 'package:ez_flutter/features/home/presentation/bloc/app_scrn/app_scrn_cubit.dart';
import 'package:ez_flutter/features/home/presentation/bloc/status_count/status_count_cubit.dart';
import 'package:ez_flutter/features/home/presentation/screen/home_page.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/blocs.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner/bpartner_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner_add/bpartner_add_cubit.dart';
import 'package:ez_flutter/features/reports/presentation/bloc/download_report/download_reports.dart';
import 'package:ez_flutter/push_notification/push_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'di/injection.dart';
import 'features/auth/presentation/bloc/blocs.dart';
import 'features/auth/presentation/ui/sign_in_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ezfinanz-BP web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.latoTextTheme(),
        colorScheme: const ColorScheme.light(
          primary: Color(0xff5AC2EE),
          onPrimary: Colors.black,
          secondary: Color(0xffffa726),
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xffeceff1),
          onSurface: Colors.black,
          brightness: Brightness.light,
          background: Colors.white,
          onBackground: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0.0,
            shadowColor: const Color(0x7040BFFF),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          contentTextStyle:
              Theme.of(context).snackBarTheme.contentTextStyle?.copyWith(
                    fontFamily: GoogleFonts.cabin().fontFamily,
                  ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        chipTheme: ChipThemeData.fromDefaults(
          brightness: Brightness.light,
          secondaryColor: const Color(0xff5AC2EE),
          labelStyle: GoogleFonts.lato(),
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'IN'),
      ],
      home: BlocBuilder<AuthCubit, AuthState>(
        builder: (ctx, state) {
          return state.when(
            initial: () => const EZSplashScreen(),
            loading: () => const EZSplashScreen(),
            authenticated: () => FutureBuilder<void>(
              future: OneSignalHelper.init(),
              builder: (_, snapshot) {
                final bpId = locator.get<User>().businessPartnerId;
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (ctx) =>
                          locator.get<AppScreenCubit>()..emitHomeScreen(),
                    ),
                    BlocProvider(
                      create: (ctx) =>
                          locator.get<AppUpdateCubit>()..checkForAppupdate(),
                    ),
                    BlocProvider(
                      create: (ctx) => locator.get<RecentLoansCubit>(),
                    ),
                    BlocProvider(
                      create: (ctx) =>
                          locator.get<BpartnerAddCubit>()..fetchInitial(bpId),
                    ),
                    BlocProvider(
                      create: (ctx) =>
                          locator.get<BpartnerCubit>()..fetchInitial(),
                    ),
                    BlocProvider(
                        create: (ctx2) => locator.get<StatusCountCubit>()),
                    BlocProvider(
                        create: (ctx2) => locator.get<DownloadReportCubit>()),
                    BlocProvider(create: (ctx2) => locator.get<LoansCubit>()),
                  ],
                  child: const HomePage(),
                );
              },
            ),
            needAppUpdate: () => const Text('Need app update'),
            unAuthenticated: () => BlocProvider(
              create: (ctx) => locator.get<SignInCubit>(),
              child: const SignInScreen(),
            ),
          );
        },
      ),
    );
  }
}
