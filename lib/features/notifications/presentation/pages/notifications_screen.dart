import 'package:ez_flutter/features/notifications/presentation/bloc/notification_bloc/notification_cubit.dart';
import 'package:ez_flutter/shared/date_format_utils.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:ez_flutter/shared/widget/empty_list_widget.dart';
import 'package:ez_flutter/shared/widget/failure_widget.dart';
import 'package:ez_flutter/shared/widget/loading_list_widget.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  void _fetchNotifications() {
    BlocProvider.of<NotificationsCubit>(context).fetchInitial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        leading: IconButton(
          icon: const Icon(FeatherIcons.arrowLeftCircle),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: RefreshIndicator(
        strokeWidth: 1.0,
        onRefresh: () {
          _refresh(context);
          return Future.value(const Duration(microseconds: 300));
        },
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                return const LoadingListWidget();
              },
              loading: () {
                return const LoadingListWidget();
              },
              success: (notifications, hasReachedMax) {
                if (notifications.isEmpty) {
                  return Center(
                    child: EmptyListWidget(
                      message: 'No notifications yet.',
                      onRefresh: _fetchNotifications,
                    ),
                  );
                }

                return ListView.builder(
                    itemCount: notifications.length,
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: AppColors.lightGrey),
                        ),
                        child: ListTile(
                          leading: const Icon(FeatherIcons.bell),
                          title: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: Text(
                              notifications[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(bottom: 8, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notifications[index].body,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      DateFormat("MMM dd, yyyy HH:mm a").format(
                                          DateTime.parse(notifications[index]
                                                  .creationDate)
                                              .add(const Duration(
                                                  hours: 5, minutes: 30))),
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              failure: (e) {
                return Center(
                  child: FailureWidget(
                    failure: e,
                    onRefresh: () {
                      _fetchNotifications();
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _refresh(BuildContext context) {
    _fetchNotifications();
  }
}
