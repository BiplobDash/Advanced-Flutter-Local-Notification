import 'package:advanced_local_notification/landing_page.dart';
import 'package:advanced_local_notification/main.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

Future<void> initializeNotification() async {
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'high_importance_channel',
        channelKey: 'high_importance_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic task',
        defaultColor: Colors.deepPurple,
        ledColor: Colors.red,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        onlyAlertOnce: true,
        playSound: true,
        criticalAlerts: true,
      )
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'high_importance_channel_group',
        channelGroupName: "Group 1",
      )
    ],
    debug: true,
  );

    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  await AwesomeNotifications().setListeners(
    onActionReceivedMethod: onActionReceivedMethod,
    onNotificationCreatedMethod: onNotificationCreatedMethod,
    onNotificationDisplayedMethod: onNotificationDisplayedMethod,
    onDismissActionReceivedMethod: onDismissActionReceivedMethod,
  );
}

Future<void> onActionReceivedMethod(ReceivedAction recivedAction) async {
  debugPrint("On Action Recived");
  final payload = recivedAction.payload ?? {};
  if (payload['navigate'] == 'true') {
    MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (_) => const LandingPage(),
    ));
  }
}

Future<void> onNotificationCreatedMethod(
    ReceivedNotification notification) async {
  debugPrint("On Notification Created Method");
}

Future<void> onNotificationDisplayedMethod(
    ReceivedNotification recivedAction) async {
  debugPrint("On Notification Displayed");
}

Future<void> onDismissActionReceivedMethod(ReceivedAction recivedAction) async {
  debugPrint("On Notification Received");
}



Future<void> showNotification({
  required final String title,
  required final String body,
  final String? summary,
  final Map<String, String>? payload,
  final ActionType actionType = ActionType.Default,
  final NotificationLayout notificationLayout = NotificationLayout.Default,
  final NotificationCategory? category,
  final String? bigPicture,
  final List<NotificationActionButton>? actionButtons,
  final bool scheduled = false,
  final int? interval,
}) async {
  assert(!scheduled || (scheduled && interval != null));
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: -1,
      channelKey: 'high_importance_channel',
      title: title,
      body: body,
      actionType: actionType,
      notificationLayout: notificationLayout,
      summary: summary,
      category: category,
      payload: payload,
      bigPicture: bigPicture,
    ),
    actionButtons: actionButtons,
    schedule: scheduled
        ? NotificationInterval(
            interval: interval,
            timeZone: AwesomeNotifications.localTimeZoneIdentifier,
            preciseAlarm: true,
          )
        : null,
  );
}
