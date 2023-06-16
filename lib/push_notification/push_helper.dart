import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/add_note/add_note_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/screen/chat_screen.dart';
import 'package:ez_flutter/features/notifications/domain/repository/notification_repository.dart';
import 'package:ez_flutter/local/db/hive_helper.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/constants/keys.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../features/loans/presentation/bloc/blocs.dart';

abstract class OneSignalHelper {
  static Future<void> init() async {
    try {
      if (!kIsWeb) {
        OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

        await OneSignal.shared.setAppId(Constants.oneSignalId);
        await OneSignal.shared.promptUserForPushNotificationPermission();

        OneSignal.shared.setNotificationWillShowInForegroundHandler(
            (OSNotificationReceivedEvent event) {
          // Will be called whenever a notification is received in foreground
          // Display Notification, pass null param for not displaying the notification
          event.complete(event.notification);
        });

        await _setSubscriptionObserver();
        await _setNotificationObserver();
      }
    } catch (e, st) {
      logError(e, st, 'could not initialize one signal');
    }
  }

  static Future<void> _setSubscriptionObserver() async {
    OneSignal.shared.setSubscriptionObserver((handler) async {
      try {
        final isSubscribed = _isSubscribed(handler);
        final isUnSubscribed = _isUnSubscribed(handler);
        final hasUserLoggedIn = locator.isRegistered<User>();

        if (isSubscribed && hasUserLoggedIn) {
          HiveHelper.markAsSubscribed();
          try {
            if (handler.to.userId != null) {
              locator
                  .get<NotificationRepository>()
                  .subscribeForPushNotifications(handler.to.userId!);
            }
          } catch (e, st) {
            logError(e, st, '');
          }
        } else if (isUnSubscribed && hasUserLoggedIn) {
          try {
            HiveHelper.markAsUnSubscribed();
            if (handler.to.userId != null) {
              locator
                  .get<NotificationRepository>()
                  .unSubscribeFromPushNotifications(handler.to.userId!);
            }
          } catch (e, st) {
            logError(e, st, '');
          }
        }
      } catch (e, st) {
        logError(e, st, '');
      }
    });
  }

  static bool _isUnSubscribed(OSSubscriptionStateChanges handler) =>
      handler.from.isPushDisabled == false && handler.to.isPushDisabled == true;

  static bool _isSubscribed(OSSubscriptionStateChanges handler) =>
      handler.from.isPushDisabled == true && handler.to.isPushDisabled == false;

  static Future<void> _setNotificationObserver() async {
    OneSignal.shared.setNotificationOpenedHandler(
      (OSNotificationOpenedResult result) {
        final additionalData = result.notification.additionalData;
        if (additionalData != null &&
            additionalData['target'] != null &&
            additionalData['target'] == 'CHAT') {
          final loanId = additionalData['pre_id'];
          final loanPoi = additionalData['poi'] ?? '';
          final status = additionalData['status'] ?? '';

          if (status == 'Draft' ||
              status == 'PreApproved' ||
              status == 'Rejected') {
            final loan = Loan(
              id: loanId,
              loanNo: loanPoi,
              customerName: '',
              mobileNumber: '',
              proofTypeNumber: '',
              loanAmount: 0,
              isPreApproved: false,
              isDisbursed: false,
              isRejected: false,
              createdAt: '',
            );

            Navigator.of(GlobalKeys.navState.currentContext!).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (ctx2) => locator.get<NotesCubit>()..fetchInitial(loan.id),
                      ),
                      BlocProvider(
                        create: (ctx2) => locator.get<AddNoteCubit>(),
                      )
                    ],
                    child: ChatScreen(
                      loanId: loan.id,
                      loanNumber: loan.loanNo,
                    ),
                  );
                },
              ),
            );
          }
        }
      },
    );
  }
}
