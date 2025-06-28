import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FcmUtil {
  FcmUtil();

  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  initForegroundNotification() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> init() async {
    try {
      NotificationSettings settings = await _firebaseMessaging
          .requestPermission(
            alert: false,
            announcement: true,
            badge: true,
            carPlay: true,
            criticalAlert: true,
            provisional: true,
            sound: Platform.isIOS ? true : false,
          );
      if (kDebugMode) {
        print('User granted permission: ${settings.authorizationStatus}');
      }
      await _firebaseMessaging.requestPermission(
        sound: true,
        badge: true,
        alert: true,
        provisional: true,
      );
      try {
        _firebaseMessaging.subscribeToTopic("FCM_ALL");
      } catch (ex) {
        //
      }
      await _firebaseMessaging.setAutoInitEnabled(true);
      _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
        if (message != null) {
          if (kDebugMode) {
            print('getInitialMessage data: ${message.data}');
          }
          if (kDebugMode) {
            print('getInitialMessage notification: ${message.notification}');
          }
        }
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        debugPrint("onMessage: $message");
        RemoteNotification? notification = message.notification;
        debugPrint("onMessage: ${message.notification?.apple?.sound}");

        AndroidNotification? android = notification?.android;
        Map<String, dynamic> data = message.data;
        if (kDebugMode) {
          print(data.toString());
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        debugPrint("onMessageOpenedApp: data ${message.data}");
        debugPrint("onMessageOpenedApp: notification ${message.notification}");
        openNotification(message);
      });
    } catch (e) {
      //
    }
  }

  getFcmToken() async {
    await _firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      debugPrint('App token $token');
    });
  }

  openNotification(RemoteMessage message) async {
    debugPrint("Open notification");
  }

  backgroundHandler() async {
    await Firebase.initializeApp();
    // FirebaseMessaging.onBackgroundMessage(
    //   LocalNotificationUtil.backgroundMessageHandler,
    // );
  }

  configureSelectNotificationSubject(BuildContext context, Function callback) {
    // LocalNotificationUtil().configureSelectNotificationSubject(
    //   context,
    //   callback,
    // );
  }

  Future<void> subscribeTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  unsubscribeTopic(String topic) async {
    // ignore: deprecated_member_use
    bool isReset = await deleteInstanceID();
    if (!isReset) {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
    }
  }

  Future<bool> deleteInstanceID() async {
    try {
      await _firebaseMessaging.deleteToken();
      return true;
    } catch (e) {
      return false;
    }
  }

  dispose() {
    // LocalNotificationUtil().dispose();
  }
}
