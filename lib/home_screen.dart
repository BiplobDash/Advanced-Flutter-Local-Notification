import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'notification_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Row(),
          ElevatedButton(
            onPressed: () {
              showNotification(
                title: "Basic Notification",
                body: "This is a Basic Notification",
              );
            },
            child: const Text("Default Notification"),
          ),
          ElevatedButton(
            onPressed: () {
              showNotification(
                title: "Basic Notification",
                body: "This is a Basic Notification",
                summary: "This is Basic Summary",
                notificationLayout: NotificationLayout.Inbox,
              );
            },
            child: const Text("Notification With Summary"),
          ),
          ElevatedButton(
            onPressed: () async {
              await showNotification(
                title: "Basic Notification",
                body: "This is a Basic Notification",
                summary: "This is Basic Summary",
                notificationLayout: NotificationLayout.BigPicture,
                bigPicture:
                    "https://i0.wp.com/devhq.in/wp-content/uploads/2024/07/2.png?w=1280&ssl=1",
              );
            },
            child: const Text("BigPicture Notification"),
          ),
          ElevatedButton(
            onPressed: () {
              showNotification(
                title: "Action noti",
                body: "This is a Action",
                payload: {
                  "navigate": "true",
                },
                actionButtons: [
                  NotificationActionButton(
                    key: 'demo',
                    label: "Demo Page",
                    actionType: ActionType.SilentAction,
                    color: Colors.deepPurple,
                  )
                ],
              );
            },
            child: const Text("Action Button Notification"),
          ),
          ElevatedButton(
            onPressed: () {
              showNotification(
                title: "Big Text Notification",
                body: "This is Big Text",
                notificationLayout: NotificationLayout.BigText,
              );
            },
            child: const Text("BigText Notification"),
          ),
          ElevatedButton(
            onPressed: () {
              showNotification(
                title: "Song Downloading",
                body: "Please wait",
                notificationLayout: NotificationLayout.ProgressBar,
              );
            },
            child: const Text("ProgressBar Notification"),
          ),
          ElevatedButton(
            onPressed: () {
              showNotification(
                title: "Nitish Kumar",
                body: "Hello What are you doing",
                notificationLayout: NotificationLayout.Messaging,
              );
            },
            child: const Text("Messaging Notification"),
          ),
          ElevatedButton(
            onPressed: () {
              showNotification(
                title: "Nitish Kumar",
                body: "Hello What are you doing",
                notificationLayout: NotificationLayout.MessagingGroup,
              );
            },
            child: const Text("Messaging Group Notification"),
          ),
          ElevatedButton(
            onPressed: () {
              showNotification(
                title: "New song playing",
                body: "Arjit ",
                notificationLayout: NotificationLayout.MediaPlayer,
              );
            },
            child: const Text("MediaPlayer Notification"),
          ),
          ElevatedButton(
            onPressed: () {
              showNotification(
                title: "New song playing",
                body: "Arjit ",
                notificationLayout: NotificationLayout.MediaPlayer,
              );
            },
            child: const Text("MediaPlayer Notification"),
          ),
        ],
      ),
    ));
  }
}
