import 'package:flutter/services.dart';
import '/core/enums/environment_enum.dart';
import '/core/utilities/enum_to_string.dart';

class AppMethodChannel extends MethodChannel {
  AppMethodChannel(super.name);

  factory AppMethodChannel.app() {
    return AppMethodChannel('app');
  }
}

extension AppMethodChannelExt on MethodChannel {
  Future<Environment?> get flavor {
    return invokeMethod<String?>('flavor').then((String? value) {
      if (value == null) {
        return null;
      }
      return EnumToString.fromString(Environment.values, value);
    });
  }
}
