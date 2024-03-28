import 'package:awesome_notifications/awesome_notifications.dart';

class InAppNotification {
  Future<void> showNotificationWithAction({
    required String title,
    required String body,
    required Map<String, dynamic> payload,
  }) async {
    // Convert payload to Map<String, String> to match the expected type
    var stringPayload =
        payload.map((key, value) => MapEntry(key, value.toString()));

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'default_channel',
        title: "New request",
        body:
            "New request for ${stringPayload['quantity']} of ${stringPayload['medicine_name']}",
        notificationLayout: NotificationLayout.Default,
        payload: stringPayload, // Use stringPayload here
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Available',
        ),
        NotificationActionButton(
          key: 'DISMISS',
          label: 'Dismiss',
          isDangerousOption: true,
        ),
      ],
    );
  }

  Future<void> showAvailableNotification(
      {required String title,
      required String body,
      required Map<String, dynamic> payload}) async {
    var stringPayload =
        payload.map((key, value) => MapEntry(key.toString(), value.toString()));
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 11,
        channelKey: 'available_channel',
        title: "Request available",
        body:
            "Your request ${stringPayload['medicine_name']} is available at ${stringPayload['pharmacy_name']} in \n ${stringPayload['address_line_01']}, ${stringPayload['address_line_02']},  ${stringPayload['city']}.",
        notificationLayout: NotificationLayout.Default,
        payload: payload.map((key, value) =>
            MapEntry(key, value.toString())), // Convert to Map<String, String?>
      ),
    );
  }
}
