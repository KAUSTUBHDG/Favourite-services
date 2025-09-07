import 'package:another_flushbar/flushbar.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '/core/constants/num_constants.dart';
import '/core/enums/toast_type_enum.dart';
import '/core/routes/routes.dart';
import '/core/themes/app_colors.dart';

/// Displays a Toast Message on the screen from top.
/// Parameters: -
/// * message: Accepts only `String`. The message to be displayed on the toast.
/// * title: Accepts only `String`. The title to be displayed on the toast.
/// * type: Accepts only `AppToastType`. Default value is `AppToastType.info`.
/// * durationInSec: Accepts only `int`, Default value is `3`. Duration of the toast in seconds.
/// * duration: Accepts only `Duration`. Default value is `null`. Custom `Duration` of the toast.
/// * position: Accepts only `FlushbarPosition`. Default value is `FlushbarPosition.TOP`.
///             Location of the toast message coming from.
/// ------------------------------
///
/// {@tool snippet}
/// {@end-tool}
Future<T?> showToast<T>(
  String message, {
  String? title,
  AppToastType type = AppToastType.info,
  int? durationInSec,
  Duration? duration,
  FlushbarPosition position = FlushbarPosition.BOTTOM,
  BuildContext? context,
  VoidCallback? onCloseTapped,
}) async {
  if (message.isEmpty) {
    return null;
  }

  final BuildContext? _ctx = context ?? appNavigatorKey.currentState?.context;
  if (_ctx == null) {
    return null;
  }

  final Flushbar<T> _bar = Flushbar<T>(
    margin: const EdgeInsets.symmetric(horizontal: NumConstants.value16),
    padding: const EdgeInsets.all(NumConstants.value3),
    borderRadius: BorderRadius.circular(NumConstants.value7),
    messageText: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: NumConstants.value4,
            decoration: BoxDecoration(
              color: type.iconBgColor,
              borderRadius: BorderRadius.circular(NumConstants.value100),
            ),
          ),
          const SizedBox(width: NumConstants.value4),
          Icon(type.icon, color: type.iconBgColor, size: NumConstants.value22),
          const SizedBox(width: NumConstants.value4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  type.valueStr,
                  style: TextStyle(
                    color: AppColors.toast.toastText,
                    fontWeight: FontWeight.bold,
                    fontSize: NumConstants.value16,
                  ),
                ),
                const SizedBox(height: NumConstants.value4),
                Text(
                  message,
                  style: TextStyle(
                    color: AppColors.toast.toastText,
                    fontWeight: FontWeight.normal,
                    fontSize: NumConstants.value14,
                  ),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    duration:
        duration ??
        (durationInSec != null
            ? Duration(seconds: durationInSec)
            : const Duration(milliseconds: NumConstants.value3500)),
    animationDuration: const Duration(milliseconds: NumConstants.value1500),
    backgroundColor: type.bgColor,
    flushbarPosition: position,
    barBlur: NumConstants.value5,
    forwardAnimationCurve: Curves.linearToEaseOut,
    reverseAnimationCurve: Curves.linearToEaseOut,
    boxShadows: <BoxShadow>[
      BoxShadow(
        color: AppColors.toast.toastText.withOpacity(NumConstants.value0p3),
        spreadRadius: NumConstants.value3,
        blurRadius: NumConstants.value8,
      ),
    ],
    mainButton:
        onCloseTapped != null
            ? IconButton(
              onPressed: onCloseTapped,
              icon: Icon(Icons.close, color: AppColors.colorA0A8B4),
            )
            : null,
  );

  return _bar.show(_ctx);
}

/* 
Future<void> showNotification(
  RemoteMessage
  message,
) async {
  if (message.notification?.body == null) {
    return;
  }
  final String _title = message.notification?.title ?? '';
  final String _body = message.notification?.body ?? '';

  await localNotificationHelper.showNotification(
    _title,
    _body,
  );
}
 */
