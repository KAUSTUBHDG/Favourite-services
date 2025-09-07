// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:logger/logger.dart';
// import '/core/firebase/index.dart';
// import '/core/logger/logger_const.dart';

// part 'firebase_remote_config_ext.dart';

// class AppRemoteConfigHelper {
//   AppRemoteConfigHelper._();
//   //* MARK: - Convert the class to singleton
//   //? =========================================================
//   static AppRemoteConfigHelper instance = AppRemoteConfigHelper._();

//   //* MARK: - Private Variables
//   //? =========================================================
//   late final FirebaseRemoteConfig _remoteConfig;

//   //* MARK: - Public Variables
//   //? =========================================================

//   FirebaseRemoteConfig get config {
//     return _remoteConfig;
//   }

//   String get clientId => _remoteConfig.getString(
//         _FirebaseRemoteConfigKeys.urls.clientId,
//       );

//   Future<void> initialize({required FirebaseApp firebaseApp}) async {
//     try {
//       _remoteConfig = FirebaseRemoteConfig.instanceFor(
//         app: firebaseApp,
//       );
//       _remoteConfig.onConfigUpdated
//           .listen(
//         (RemoteConfigUpdate event) async => await _remoteConfig.activate(),
//       )
//           .onError(
//         (Object e) {
//           // return FirebaseHelper.crashlytics.logException(
//           //   e: e,
//           //   trace: StackTrace.current,
//           // );
//         },
//       );

//       await _remoteConfig.setConfigSettings(
//         RemoteConfigSettings(
//           fetchTimeout: const Duration(minutes: 1),
//           minimumFetchInterval: const Duration(hours: 1),
//         ),
//       );
//       await _remoteConfig.setDefaults(
//         _FirebaseRemoteConfigKeys.defaultValues.defaultValues,
//       );

//       await _remoteConfig.fetchAndActivate().onError(
//         (Object? error, StackTrace stackTrace) {
//           FirebaseCrashlytics.instance.recordError(
//             error,
//             stackTrace,
//           );
//           return false;
//         },
//       );
//       logger.log(
//         Level.debug,
//         "Checking Remote Config: ${_remoteConfig.getString(
//           'enforcedVersion',
//         )}",
//       );
//     } catch (error, stackTrace) {
//       /// Set default values if the fetch fails
//       await _remoteConfig.setDefaults(
//         _FirebaseRemoteConfigKeys.defaultValues.defaultValues,
//       );
//       logger.log(
//         Level.error,
//         "Error in Remote Config: ${error.toString()}",
//       );
//       await FirebaseCrashlytics.instance.recordError(
//         error,
//         stackTrace,
//       );
//     }
//   }
// }
