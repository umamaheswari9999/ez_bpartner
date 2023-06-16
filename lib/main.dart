import 'dart:async';
import 'dart:developer' as dev;
import 'dart:isolate';

import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/blocs.dart';
import 'package:ez_flutter/firebase_options.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  await initFirebase();
  await Hive.initFlutter();
  await Hive.openBox('appBox');

  if (!kIsWeb) {
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      try {
        final errorAndStacktrace = pair as List<dynamic>;
        dev.log(errorAndStacktrace.toString());
      } catch (e) {
        // pass
      }
    }).sendPort);
  }
  

  runZonedGuarded(() {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => locator.get<AuthCubit>()..checkUserSession(),
          ),
          BlocProvider(create: (ctx) => locator.get<AppUpdateCubit>()),
        ],
        child: const App(),
      ),
    );
  }, (ex, st) {
    logError(ex, st, 'App Gaurd');
  });
}

Future<void> initFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e, st) {
    logError(e, st, 'can\'t Initialize firebase');
  }
}
