// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// final LocalNotificationHelper localNotificationHelper =
//     LocalNotificationHelper();

// /// A singleton class to manage local notifications in the application.
// ///
// /// This class provides methods to initialize notifications, request permissions,
// /// and show notifications to the user. It supports Android, iOS, and
// class LocalNotificationHelper {
//   // Singleton Pattern
//   factory LocalNotificationHelper() {
//     return _notificationService;
//   }

//   LocalNotificationHelper._internal();

//   //* MARK: - Private Variables
//   //? =========================================================
//   static final LocalNotificationHelper _notificationService =
//       LocalNotificationHelper._internal();

//   static const String channelId = "1";

//   static const String darwinNotificationCategoryText = 'textCategory';

//   static const String darwinNotificationCategoryPlain = 'plainCategory';

//   /// A notification action which triggers a App navigation event
//   static const String navigationActionId = 'id_3';

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static const AndroidNotificationDetails _androidNotificationDetails =
//       AndroidNotificationDetails(
//     channelId,
//     "loan_officer",
//     channelDescription:
//         "This channel is responsible for all the local notifications",
//     priority: Priority.high,
//     importance: Importance.high,
//     icon: 'logo',
//   );

//   static const DarwinNotificationDetails _darwinNotificationDetails =
//       DarwinNotificationDetails(
//     badgeNumber: 0,
//     presentAlert: true,
//     presentSound: true,
//     presentBadge: false,
//   );

//   NotificationDetails get notificationDetails => const NotificationDetails(
//         android: _androidNotificationDetails,
//         iOS: _darwinNotificationDetails,
//       );

//   //* MARK: - Public Methods
//   //? =========================================================
//   /// Initializes the local notification settings for the application.
//   ///
//   /// This method sets up the notification channels, categories, and
//   /// handlers for incoming notifications. It also initializes the
//   /// Flutter local notifications plugin.
//   Future<void> init() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('logo');

//     final List<DarwinNotificationCategory> darwinNotificationCategories =
//         <DarwinNotificationCategory>[
//       DarwinNotificationCategory(
//         darwinNotificationCategoryText,
//         actions: <DarwinNotificationAction>[
//           DarwinNotificationAction.text(
//             'text_1',
//             'Action 1',
//             buttonTitle: 'Send',
//             placeholder: 'Placeholder',
//           ),
//         ],
//       ),
//       DarwinNotificationCategory(
//         darwinNotificationCategoryPlain,
//         actions: <DarwinNotificationAction>[
//           DarwinNotificationAction.plain('id_1', 'Action 1'),
//           DarwinNotificationAction.plain(
//             'id_2',
//             'Action 2 (destructive)',
//             options: <DarwinNotificationActionOption>{
//               DarwinNotificationActionOption.destructive,
//             },
//           ),
//           DarwinNotificationAction.plain(
//             navigationActionId,
//             'Action 3 (foreground)',
//             options: <DarwinNotificationActionOption>{
//               DarwinNotificationActionOption.foreground,
//             },
//           ),
//           DarwinNotificationAction.plain(
//             'id_4',
//             'Action 4 (auth required)',
//             options: <DarwinNotificationActionOption>{
//               DarwinNotificationActionOption.authenticationRequired,
//             },
//           ),
//         ],
//         options: <DarwinNotificationCategoryOption>{
//           DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
//         },
//       ),
//     ];

//     /// Note: permissions aren't requested here just to demonstrate that can be
//     /// done later
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//       onDidReceiveLocalNotification:
//           (int id, String? title, String? body, String? payload) async {
//         logger.debug(
//           'onDidReceiveLocalNotification called.\n'
//           'id: $id\n'
//           'title: $title\n'
//           'body: $body\n'
//           'payload: $payload',
//         );
//       },
//       notificationCategories: darwinNotificationCategories,
//     );
//     final LinuxInitializationSettings initializationSettingsLinux =
//         LinuxInitializationSettings(
//       defaultActionName: 'Open notification',
//       defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
//     );
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//       macOS: initializationSettingsDarwin,
//       linux: initializationSettingsLinux,
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) {
//         logger.debug(
//           'onDidReceiveNotificationResponse called.\n'
//           '${notificationResponse.toString()}',
//         );
//       },
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//   }

//   /// Requests the necessary permissions to display notifications on iOS.
//   ///
//   /// This method prompts the user for permission to show alerts,
//   /// badges, and sounds for notifications. It should be called
//   /// at an appropriate time in the application flow.
//   Future<void> requestPermissions() async {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }

//   /// Displays a local notification with the specified title and body.
//   ///
//   /// Parameters:
//   /// * [title]: The title of the notification.
//   /// * [body]: The body text of the notification.
//   ///
//   /// This method triggers a notification that appears in the system
//   /// notification tray.
//   Future<void> showNotification(
//     String title,
//     String body,
//   ) async {
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//     );
//   }
// }

// /// Handles background notifications when the application is not in the foreground.
// ///
// /// This function is marked as an entry point for the VM and processes
// /// notification responses received while the app is in the background.
// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   if (kDebugMode) {
//     debugPrint('notification(${notificationResponse.id}) action tapped: '
//         '${notificationResponse.actionId} with'
//         ' payload: ${notificationResponse.payload}');
//   }
//   if (notificationResponse.input?.isNotEmpty ?? false) {
//     if (kDebugMode) {
//       debugPrint(
//         'notification action tapped with input: ${notificationResponse.input}',
//       );
//     }
//   }
// }
