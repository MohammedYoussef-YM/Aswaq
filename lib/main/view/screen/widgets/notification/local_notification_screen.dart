import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'dart:ui';
import 'package:path_provider/path_provider.dart';

class LocalNotificationScreen extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    var androidInitialize = new AndroidInitializationSettings('app_icon');
    var iOSInitialize = new IOSInitializationSettings();
    var initializationsSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationsSettings);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Local Notification Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
          child: Center(
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: _showNotification,
                  child: Text('Text Notification'),
                ),

                ElevatedButton(
                  onPressed: () {
                    _showBigPictureNotificationHiddenLargeIcon(context);
                  },
                  child: Text('Text Notification with Image'),
                ),

                ElevatedButton(
                  onPressed: _showProgressNotification,
                  child: Text('Progress Notification'),
                ),

                ElevatedButton(
                  onPressed: _showInboxNotification,
                  child: Text('Inbox Notification'),
                ),

                ElevatedButton(
                  onPressed: _showGroupedNotifications,
                  child: Text('Group Notification'),
                ),

              ],
            ),
          )),
    );
  }

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your channel id', 'your channel name', 'your channel description',
      importance: Importance.max, priority: Priority.high, ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0, 'Notification title', '6am Local Notification Body',
      platformChannelSpecifics, payload: 'item x',
    );
  }

  Future<void> _showBigPictureNotificationHiddenLargeIcon(BuildContext context) async {
    final String largeIconPath = await saveImage(context, Image.asset('assets/logo.jpg'));
    final String bigPicturePath = await saveImage(context, Image.asset('assets/logo.jpg'));
    final BigPictureStyleInformation bigPictureStyleInformation =
    BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
        hideExpandedLargeIcon: true,
        contentTitle: 'Notification title',
        htmlFormatContentTitle: true,
        summaryText: '6am Local Notification Body',
        htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('big text channel id',
        'big text channel name', 'big text channel description',
        largeIcon: FilePathAndroidBitmap(largeIconPath),
        styleInformation: bigPictureStyleInformation);
    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'Notification title', '6am Local Notification Body', platformChannelSpecifics);
  }

  Future<String> saveImage(BuildContext context, Image image) {
    final completer = Completer<String>();

    image.image.resolve(ImageConfiguration()).addListener(ImageStreamListener((imageInfo, _) async {
      final byteData = await imageInfo.image.toByteData(format: ImageByteFormat.png);
      final pngBytes = byteData.buffer.asUint8List();

      final fileName = pngBytes.hashCode;
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      completer.complete(filePath);
    }));

    return completer.future;
  }

  Future<void> _showProgressNotification() async {
    const int maxProgress = 5;
    for (int i = 0; i <= maxProgress; i++) {
      await Future<void>.delayed(const Duration(seconds: 1), () async {
        final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('progress channel', 'progress channel',
            'progress channel description',
            channelShowBadge: false,
            importance: Importance.max,
            priority: Priority.high,
            onlyAlertOnce: true,
            showProgress: true,
            maxProgress: maxProgress,
            progress: i);
        final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
            0,
            'progress notification title',
            'progress notification body',
            platformChannelSpecifics,
            payload: 'item x');
      });
    }
  }

  Future<void> _showInboxNotification() async {
    final List<String> lines = <String>['line <b>1</b>', 'line <i>2</i>'];
    final InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
        lines,
        htmlFormatLines: true,
        contentTitle: 'overridden <b>inbox</b> context title',
        htmlFormatContentTitle: true,
        summaryText: 'summary <i>text</i>',
        htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('inbox channel id', 'inboxchannel name',
        'inbox channel description',
        styleInformation: inboxStyleInformation);
    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'inbox title', 'inbox body', platformChannelSpecifics);
  }

  Future<void> _showGroupedNotifications() async {
    const String groupKey = 'com.android.example.WORK_EMAIL';
    const String groupChannelId = 'grouped channel id';
    const String groupChannelName = 'grouped channel name';
    const String groupChannelDescription = 'grouped channel description';
    // example based on https://developer.android.com/training/notify-user/group.html
    const AndroidNotificationDetails firstNotificationAndroidSpecifics =
    AndroidNotificationDetails(
        groupChannelId, groupChannelName, groupChannelDescription,
        importance: Importance.max,
        priority: Priority.high,
        groupKey: groupKey);
    const NotificationDetails firstNotificationPlatformSpecifics =
    NotificationDetails(android: firstNotificationAndroidSpecifics);
    await flutterLocalNotificationsPlugin.show(1, '6am',
        '6am poked you', firstNotificationPlatformSpecifics);
    const AndroidNotificationDetails secondNotificationAndroidSpecifics =
    AndroidNotificationDetails(
        groupChannelId, groupChannelName, groupChannelDescription,
        importance: Importance.max,
        priority: Priority.high,
        groupKey: groupKey);
    const NotificationDetails secondNotificationPlatformSpecifics =
    NotificationDetails(android: secondNotificationAndroidSpecifics);
    await flutterLocalNotificationsPlugin.show(
        2,
        'Tech 6am',
        'Please join us to celebrate the...',
        secondNotificationPlatformSpecifics);

    const List<String> lines = <String>[
      'Alex Faarborg  Check this out',
      'Jeff Chang    Launch Party'
    ];
    const InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
        lines,
        contentTitle: '2 messages',
        summaryText: 'janedoe@example.com');
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        groupChannelId, groupChannelName, groupChannelDescription,
        styleInformation: inboxStyleInformation,
        groupKey: groupKey,
        setAsGroupSummary: true);
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        3, 'Attention', 'Two messages', platformChannelSpecifics);
  }

}
