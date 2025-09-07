import 'package:favorite_services_app/core/config/app_config.dart';
import 'package:favorite_services_app/presentation/screen/app/app.dart';
import 'package:flutter/material.dart';

void main() async {
  // final WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AppConfig.configure(
    completer: (dynamic result) {
      // FlutterNativeSplash.remove();
      runApp(const MyApp());
    },
  );
}
