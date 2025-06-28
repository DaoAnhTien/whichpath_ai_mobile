import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:wichpath_ai/commons/views/_listen_notification.dart'
    show ListenNotification;

import '../domain/data/models/received_notification.dart';

class LocalNotificationUtil {
  LocalNotificationUtil() {
    flutterLocalNotificationsPlugin ??= FlutterLocalNotificationsPlugin();
    didReceiveLocalNotificationSubject ??=
        BehaviorSubject<ReceivedNotification>();
    selectNotificationSubject ??= BehaviorSubject<String>();
  }

  static FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  // Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function
  static BehaviorSubject<ReceivedNotification>?
  didReceiveLocalNotificationSubject;

  static BehaviorSubject<String>? selectNotificationSubject =
      BehaviorSubject<String>();

  static NotificationAppLaunchDetails? notificationAppLaunchDetails;

  void init() async {
    var initializationSettingsAndroid = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
    // of the `IOSFlutterLocalNotificationsPlugin` class
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const DarwinInitializationSettings initializationSettingsMacOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS,
    );
    await flutterLocalNotificationsPlugin!.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (
        NotificationResponse notificationResponse,
      ) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            selectNotificationSubject!.sink.add(
              notificationResponse.payload ?? 'null',
            );
            break;
          case NotificationResponseType.selectedNotificationAction:
            break;
        }
      },
    );
    await isAndroidPermissionGranted();
  }

  Future<void> isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted =
          await flutterLocalNotificationsPlugin
              ?.resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >()
              ?.areNotificationsEnabled() ??
          false;
      debugPrint('Android 13 areNotificationsEnabled: $granted');

      if (!granted) {
        final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
            flutterLocalNotificationsPlugin
                ?.resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin
                >();

        final bool result =
            await androidImplementation?.requestNotificationsPermission() ??
            false;
        debugPrint('Android 13 requestPermission: $result');
      }
    }
  }

  requestIOSPermissions() async {
    var result = await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
    return result;
  }

  void configureDidReceiveLocalNotificationSubject(BuildContext context) {
    didReceiveLocalNotificationSubject!.stream.listen((
      ReceivedNotification receivedNotification,
    ) async {
      await showDialog(
        context: context,
        builder:
            (BuildContext context) => CupertinoAlertDialog(
              title:
                  receivedNotification.title != null
                      ? Text(receivedNotification.title ?? '')
                      : null,
              content:
                  receivedNotification.body != null
                      ? Text(receivedNotification.body ?? '')
                      : null,
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text('Ok'),
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ListenNotification(
                              receivedNotification.payload ?? '',
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
      );
    });
  }

  void configureSelectNotificationSubject(
    BuildContext context,
    Function callback,
  ) {
    selectNotificationSubject!.stream.listen((String payload) {
      Get.log('Hoan test: $payload');
      Map<String, dynamic> data = jsonDecode(payload);
      Get.log('onOpenLocalNotification $data');
    });
  }

  Future<NotificationAppLaunchDetails?>
  getNotificationAppLaunchDetails() async {
    return await flutterLocalNotificationsPlugin!
        .getNotificationAppLaunchDetails();
  }

  void dispose() {
    if (didReceiveLocalNotificationSubject != null) {
      didReceiveLocalNotificationSubject!.close();
    }
    if (selectNotificationSubject != null) {
      selectNotificationSubject!.close();
    }
  }

  Future<void> showNotification(
    int id,
    String title,
    String body,
    String androidChannelId,
    String androidChannelName,
    String androidChannelDescription, {
    String? payload,
    String? ticker,
    String sound = 'default',
    bool playSound = true,
    Importance importance = Importance.max,
    Priority priority = Priority.high,
  }) async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'driver_noti_id',
      'Driver Local Notification',
      description: 'Local Notification',
      // description
      importance: Importance.max,
    );
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      androidChannelId,
      androidChannelName,
      channelDescription: androidChannelDescription,
      importance: importance,
      priority: priority,
      ticker: ticker,
      playSound: false,
      sound: UriAndroidNotificationSound("assets/images/bell.wav"),
    );
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails(
      presentSound: true,
      presentBadge: true,
      presentAlert: true,
      sound: sound == 'default' ? null : '$sound.wav',
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: sound == 'default' ? null : iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
    await flutterLocalNotificationsPlugin!.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<void> repeatNotification(
    int id,
    String title,
    String body,
    RepeatInterval repeatInterval,
    String androidChannelId,
    String androidChannelName,
    String androidChannelDescription, {
    String? payload,
  }) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      androidChannelId,
      androidChannelName,
      channelDescription: androidChannelDescription,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin!.periodicallyShow(
      id,
      title,
      body,
      repeatInterval,
      platformChannelSpecifics,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  Future<void> zonedScheduleNotification() async {
    await flutterLocalNotificationsPlugin!.zonedSchedule(
      0,
      'scheduled title',
      'scheduled body',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
          sound: RawResourceAndroidNotificationSound('driver_new_order'),
          playSound: true,
          importance: Importance.max,
          priority: Priority.max,
          enableLights: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  @pragma('vm:entry-point')
  static Future<dynamic> backgroundMessageHandler(RemoteMessage message) async {
    debugPrint("onBackgroundMessage data: ${message.data}");
    debugPrint("noti data: ${message.notification}");
    RemoteNotification? notification = message.notification;
    Map<String, dynamic> _ = message.data;
    AndroidNotification? _ = notification?.android;
  }

  Future<void> checkPendingNotificationRequests(BuildContext context) async {
    var pendingNotificationRequests =
        await flutterLocalNotificationsPlugin!.pendingNotificationRequests();
    for (var pendingNotificationRequest in pendingNotificationRequests) {
      debugPrint(
        'pending notification: [id: ${pendingNotificationRequest.id}, title: ${pendingNotificationRequest.title}, body: ${pendingNotificationRequest.body}, payload: ${pendingNotificationRequest.payload}]',
      );
    }
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            '${pendingNotificationRequests.length} pending notification requests',
          ),
          actions: [],
        );
      },
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin!.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin!.cancelAll();
  }

  Future<void> onDidReceiveLocalNotification(
    BuildContext context,
    int id,
    String title,
    String body,
    String payload,
  ) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder:
          (BuildContext context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('Ok'),
                onPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListenNotification(payload),
                    ),
                  );
                },
              ),
            ],
          ),
    );
  }
}
