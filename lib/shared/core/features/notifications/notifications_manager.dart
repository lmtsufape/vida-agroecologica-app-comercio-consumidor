// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationManager {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId', 
        'channelName',
        importance: Importance.max,
        icon: 'ic_notification',
      ),
    );
  }

  @pragma('vm:entry-point')
  void notificationTapBackground(NotificationResponse notificationResponse) {
    // Código para lidar com a ação ao clicar na notificação em background
  }

  Future init({
    bool initScheduled = false,
    required BuildContext context,
    required GlobalKey<NavigatorState> key,
  }) async {
    log('Initializing notification manager...');

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('ic_notification'),
    );

    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: ((NotificationResponse response) async {
        // Lógica ao receber a resposta da notificação
      }),
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails());

  static Future showNotificationAfterTime({
    int id = 0,
    required String teaTitle,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduleDate,
    required BuildContext context,
  }) async {
    return _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduleDate, tz.local),
      await _notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exact, // Corrigido com parâmetro necessário
    ).then((value) {
      // Atualize o estado de alarme ou faça outras ações aqui
    });
  }

  static Future getActiveAlarm() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await _notifications.pendingNotificationRequests();
    return pendingNotificationRequests;
  }
}
