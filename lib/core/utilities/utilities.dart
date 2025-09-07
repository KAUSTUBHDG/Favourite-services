// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '/core/constants/num_constants.dart';
import '/core/constants/strings.dart';
import '/core/themes/app_colors.dart';

part 'date_time_format.dart';

class Utilities {
  // Private constructor
  Utilities._internal();
  // Convert the class to singleton
  static final Utilities instance = Utilities._internal();

  static _DateTimeFormat get dateTimeFormat => _DateTimeFormat();

  // Future<bool> checkInternet() async {
  //   final List<ConnectivityResult> connectivityResult =
  //       await Connectivity().checkConnectivity();
  //   if (connectivityResult[0] == ConnectivityResult.mobile) {
  //     return false;
  //   } else if (connectivityResult[0] == ConnectivityResult.wifi) {
  //     return false;
  //   }
  //   return true;
  // }

  Future<void> showDeleteConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onDeletePressed,
    required VoidCallback onCancelPressed,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Theme.of(context).platform == TargetPlatform.iOS) {
          return CupertinoAlertDialog(
            title: _title(title),
            content: _content(content),
            actions: <Widget>[
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: onDeletePressed,
                child: _deleteButtonText(),
              ),
              CupertinoDialogAction(
                onPressed: onCancelPressed,
                child: _cancelButtonText(),
              ),
            ],
          );
        }
        return AlertDialog(
          title: _title(title),
          content: _content(content),
          actions: <Widget>[
            TextButton(onPressed: onDeletePressed, child: _deleteButtonText()),
            TextButton(onPressed: onCancelPressed, child: _cancelButtonText()),
          ],
        );
      },
    );
  }

  Text _cancelButtonText() {
    return Text(
      AppStrings.cancel,
      style: TextStyle(
        fontSize: NumConstants.value14,
        fontWeight: FontWeight.w400,
        color: AppColors.color386BF6,
      ),
    );
  }

  Text _deleteButtonText() {
    return Text(
      AppStrings.delete,
      style: TextStyle(
        fontSize: NumConstants.value14,
        fontWeight: FontWeight.w500,
        color: AppColors.colorED2323,
      ),
    );
  }

  Text _content(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: NumConstants.value14,
        fontWeight: FontWeight.w400,
        color: AppColors.color281A3E,
      ),
    );
  }

  Text _title(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: NumConstants.value16,
        fontWeight: FontWeight.w500,
        color: AppColors.color281A3E,
      ),
    );
  }
}
